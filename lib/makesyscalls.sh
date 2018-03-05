#!/bin/sh
# generate syscall stubs

in=syscalls.S.stub

if [ -e "$1" ]
then
	list=$1
else
	exit 1
fi

src=

while read -r nr name
do
	src="$src $name.S"
	sed -e s/{NR}/"$nr"/ -e s/{NAME}/"$name"/ "$in" > "$name".S
done < "$list"

echo "SYSCALLS_SRC := $src" > syscalls.d
