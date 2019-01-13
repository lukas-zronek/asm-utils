#!/bin/sh
# generate syscalls

if [ -e "$1" ] && [ -e "$2" ] && [ -n "$3" ]
then
	template=$1
	list=$2
	out=$3
else
	exit 1
fi

rm -f "$out"

while read -r nr name
do
	name=syscall_$name
	sed -e s/{NR}/"$nr"/ -e s/{NAME}/"$name"/ "$template" >> "$out"
done < "$list"
