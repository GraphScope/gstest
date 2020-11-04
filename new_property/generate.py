import sys
import random

def label_to_index(src_label, dst_label, e_label, v_label_num, e_label_num):
	return e_label * v_label_num * v_label_num + src_label * v_label_num + dst_label

def index_to_labels(index, v_label_num, e_label_num):
	e_label = int(index / (v_label_num * v_label_num))
	remaining = index - e_label * v_label_num * v_label_num
	src_label = int(remaining / v_label_num)
	dst_label = remaining - src_label * v_label_num
	return src_label, dst_label, e_label

prefix = sys.argv[1]
e_label_num = int(sys.argv[2])
v_label_num = int(sys.argv[3])

v_num = 81307
v_label_map = []
for i in range(v_num):
	v_label_map.append(random.randint(0, v_label_num - 1))

for i in range(v_label_num):
	fout = open(prefix + "_v_" + str(i), 'w')
	fout.write('id,weight\n')
	for v in range(v_num):
		if v_label_map[v] == i:
			fout.write(str(v) + ',' + str(v % 100) + '.' + str((v % 7) + 1) + '\n')
	fout.flush()
	fout.close()

efile_num = v_label_num * v_label_num * e_label_num
files = []
for i in range(efile_num):
	src_label, dst_label, e_label = index_to_labels(i, v_label_num, e_label_num)
	fout = open(prefix + "_e_" + str(src_label) + "_" + str(dst_label) + "_" + str(e_label), 'w')
	fout.write('src,dst,weight\n')
	files.append(fout)

fin_e = open('./twitter.e', 'r')
for line in fin_e.readlines():
	data = line.strip().split()
	src = int(data[0])
	dst = int(data[1])
	weight = int(data[2])
	src_label = v_label_map[src]
	dst_label = v_label_map[dst]
	e_label = random.randint(0, e_label_num - 1)
	index = label_to_index(src_label, dst_label, e_label, v_label_num, e_label_num)
	files[index].write(str(src) + ',' + str(dst) + ',' + str(weight) + '\n')

for fout in files:
	fout.flush()
	fout.close()
