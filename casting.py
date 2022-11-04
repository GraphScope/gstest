#!/usr/bin/env python3

import argparse
import os

import pandas as pd


def parse_args():
    parser = argparse.ArgumentParser(
        "casting.py: casting between csv, orc, parquet and hdf" "\n" "\n" "casting.py"
    )
    parser.add_argument(
        "-f", "--from", dest="from_type", required=True, help="From which file type"
    )
    parser.add_argument(
        "-t", "--to", dest="to_type", required=False, help="To which file type"
    )
    parser.add_argument(
        "-d",
        "--delimiter",
        default=",",
        required=False,
        help="Delimiter, default to be ','",
    )
    parser.add_argument(
        "--output-delimiter",
        default=None,
        required=False,
        help="Output delimiter, default to be same as input delimiter",
    )
    parser.add_argument(
        "--header",
        action="store_true",
        default=False,
        help="Whether the input file has header, default to be False",
    )
    parser.add_argument(
        "--index",
        action="store_true",
        default=False,
        help="Whether the input file has index column, default to be False",
    )
    parser.add_argument(
        "--column-type",
        dest="column_types",
        nargs="*",
        help="column types, can be multiple value, each one as format 'column_name:column_type'",
    )
    parser.add_argument(
        "--column-names",
        default=None,
        help="column names, multiple column names are seperated by ','",
    )
    parser.add_argument(
        "--filter-column-names",
        default=None,
        help="column names to keep in the final target, multiple column names are seperated by ','",
    )
    parser.add_argument(
        '--chunk-size',
        type=int,
        default=None,
        required=False,
        help='Chunk size for writing output file, default to be None',
    )
    parser.add_argument("input_file", help="Input file path")
    parser.add_argument("output_file", nargs="*", help="Output file path, optional")

    parser.usage = parser.format_help()
    return parser.parse_args()


def read_input(args):
    print("[casting.py] reading input file: %s" % args.input_file)
    if hasattr(pd, "read_csv") and args.from_type == "csv":
        kwargs = {}
        if args.delimiter:
            kwargs["sep"] = args.delimiter
        if args.header:
            kwargs["header"] = 0
        else:
            kwargs["header"] = None
        if args.index:
            kwargs["index_col"] = 0
        if args.column_names:
            kwargs["names"] = args.column_names.split(",")
        if args.column_types:
            kwargs["dtype"] = {}
            for column_type in args.column_types:
                column_name, column_type = column_type.split(":")
                kwargs["dtype"][column_name] = column_type
        if args.filter_column_names:
            kwargs["usecols"] = args.filter_column_names.split(",")
        return pd.read_csv(args.input_file, **kwargs)
    elif hasattr(pd, "read_orc") and args.from_type == "orc":
        kwargs = {}
        if args.filter_column_names:
            kwargs["columns"] = args.column_names.split(",")
        return pd.read_orc(args.input_file, **kwargs)
    elif hasattr(pd, "read_parquet") and args.from_type == "parquet":
        kwargs = {}
        if args.filter_column_names:
            kwargs["columns"] = args.column_names.split(",")
        return pd.read_parquet(args.input_file, **kwargs)
    elif hasattr(pd, "read_hdf") and args.from_type == "hdf":
        kwargs = {}
        if args.filter_column_names:
            kwargs["columns"] = args.column_names.split(",")
        return pd.read_hdf(args.input_file, **kwargs)
    else:
        raise ValueError("Unsupported from file type: %s" % args.from_type)


def write_output(args, dataframe):
    output_path = args.output_file
    if not output_path:
        if args.input_file.endswith(".%s" % args.from_type):
            output_path = args.input_file[: -len(args.from_type)] + args.to_type
        else:
            output_path = args.input_file + "." + args.to_type
    else:
        output_path = output_path[0]
    if os.path.dirname(output_path):
        os.makedirs(os.path.dirname(output_path), exist_ok=True)

    print("[casting.py] writing output file: %s" % output_path)
    if hasattr(dataframe, "to_csv") and args.to_type == "csv":
        kwargs = {"index": args.index}
        if args.output_delimiter:
            kwargs["sep"] = args.output_delimiter
        else:
            kwargs["sep"] = args.delimiter
        if args.header:
            kwargs["header"] = True
        dataframe.to_csv(output_path, **kwargs)
    elif hasattr(dataframe, "to_orc") and args.to_type == "orc":
        kwargs = {"index": args.index}
        if args.chunk_size is not None:
            kwargs["batch_size"] = args.chunk_size
            kwargs["engine"] = 'pyarrow'
        dataframe.to_orc(output_path, **kwargs)
    elif hasattr(dataframe, "to_parquet") and args.to_type == "parquet":
        kwargs = {"index": args.index}
        # see also: https://stackoverflow.com/a/61499890/5080177
        if args.chunk_size is not None:
            kwargs["row_group_size"] = args.chunk_size
            kwargs["engine"] = 'pyarrow'
        dataframe.to_parquet(output_path, **kwargs)
    elif hasattr(dataframe, "to_hdf") and args.to_type == "hdf":
        kwargs = {"index": args.index}
        dataframe.to_hdf(output_path, "data", **kwargs)
    else:
        raise ValueError("Unsupported to file type: %s" % args.to_type)


def main(args):
    dataframe = read_input(args)
    print("[casting.py] dataframe dtypes:\n%s" % dataframe.dtypes)
    print("[casting.py] dataframe has %d columns" % len(dataframe))
    write_output(args, dataframe)


if __name__ == "__main__":
    main(parse_args())
