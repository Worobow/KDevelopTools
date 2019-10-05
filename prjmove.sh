#!/bin/sh

n=$(dirname "$PWD")

dirs=$(find -name .kdev4)
for d in $dirs
do
   files=$(find $d -type f -name *.kdev4)
   for f in $files
   do

	bv=$(grep "Build Directory Path=" $f )
	b=${bv##*=}
	o=$(dirname "$b")
	p=$(basename ${f%.kdev4})
	n=$n/$p
	echo pr=$p
	echo n=$n
	echo o=$o
	if [ $n != $o ] ;then
	    sed "s#$o#$n#" -i  $f 
	else
	    echo the same folder....
	fi
#      git add -f $newFile
   done   
done