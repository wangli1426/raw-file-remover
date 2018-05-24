#!/bin/bash
mkdir -p deleted-files
while getopts ":r:" o; do
    case "${o}" in
	r)
	    RAW_DIR=${OPTARG}
	    echo "Raw file dir is set to $RAW_DIR"
	    ;;
    esac
done

CURRENT=`pwd`
cd $RAW_DIR

for f in ./*.raw; do
	#echo $f
	#awk -F" +|/" '{print 5,$NF}' $f
	str=${f#*/}
	str=${str%.raw}
	if [ ! -f "$CURRENT/$str.img" ]; then
		mv $f $CURRENT/deleted-files/
		echo "file $f is moved to $CURRENT/deleted-files/"
	fi
done

cd $CURRENT
