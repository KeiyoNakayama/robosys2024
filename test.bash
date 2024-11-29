#!/bin/bash -xv
#SPDX-FileCopyrightText: 2024 Keiyo Nakayama
# SPDX-License-Identifier: BSD-3-Clause

ng (){
	echo ${1}行目が違うよ
	res=1
}

res=0

out=$(seq 5 | ./plus)
[ "${out}" = 15 ] || ng "$LINENO"

out=$(echo あ | ./plus)
[ "$?" = 1 ]
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo | ./plus)
[ "$?" = 1 ]
[ "${out}" = "" ] || ng "$LINENO"

for i in $(seq 1 100); do
    out=$(echo "$i" | ./guess_number)
    if [[ "$out" != "正解！" ]]; then
	res=1
	[ "$?" = 0 ] || ng "$LINENO"
	break
    else
	    [ "$?" = 1 ] || ng "$LINENO"
	fi
done
    

out=$(echo "あ" | ./guess_number)
[ "$?" = 1 ] || ng "$LINENO"

[ "$res" = 0 ] && echo OK
exit $res
