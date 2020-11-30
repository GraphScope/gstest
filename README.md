gstest
======

Everything we need to test the GraphScope project.

Git LFS
-------

The gstest includes some large dataset and [git-lfs](https://git-lfs.github.com/) is enabled for tracking that issue.

You may need install `git-lfs` first:

+ on Mac: `brew install git-lfs`
+ on Ubuntu: `apt-get install git-lfs`

And fetch large files in dataset (**if you need**):

+ in the repo: `git lfs pull`

Note that currently git-lfs is only enabled for `.tar.gz` files.
