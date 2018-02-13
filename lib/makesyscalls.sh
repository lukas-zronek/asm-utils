#!/bin/sh
# generate syscalls.S

begin=syscalls.S.head
in=syscalls.S.stub
out=syscalls.S

if [ -e "$1" ]
then
	list=$1
else
	exit 1
fi

cp "$begin" "$out"

while read -r nr name
do
	sed -e s/{NR}/"$nr"/ -e s/{NAME}/"$name"/ "$in" >> "$out"
done < "$list"
