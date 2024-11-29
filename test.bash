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

out=$(echo | ./guess_number)
[ "$?" = 1 ]
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo "あ" | ./guess_number)
[ "$?" = 1 ] || ng "$LINENO"

[ "$res" = 0 ] && echo OK
exit $res
