#!/bin/sh
# generate syscall stubs

if [ -e "$1" ] && [ -e "$2" ]
then
	stub=$1
	list=$2
else
	exit 1
fi

src=

while read -r nr name
do
	name=syscall_$name
	src="$src $name.S"
	sed -e s/{NR}/"$nr"/ -e s/{NAME}/"$name"/ "$stub" > "$name".S
done < "$list"

echo "SYSCALLS_SRC := $src" > syscalls.d
