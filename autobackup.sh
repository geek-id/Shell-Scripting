#!/bin/bash
# Script bash for automation backup

TIME=`date +%d-%b-%y`
FILENAME=backup_$TIME.tar.gz

srcdir=$1
dstdir=$2

if [ $# -ne 2 ]; then
    echo $0: usage: autobackup.sh src_dir dst_dir
    exit 1
fi

tar -cpzf $dstdir/$srcdir'_'$FILENAME $srcdir
