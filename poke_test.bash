#!/usr/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Shogo Takizawa
# SPDX-License-Identifier: BSD-3-Clause

ng(){
	echo ${1}行目が違う
	res=1
}
res=0

readarray -t arr < <(echo garchomp | ./poke )
expected=(108 130 95 80 85 102)

for i in $(seq 0 5); do
        [ "${arr[$i]}" == "${expected[$i]}" ] || ng "$LINENO"
done


out=$(echo hoge | ./poke)
status=$?
[ "$status" = "1" ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo | ./poke )
status=$?
[ "$status" = "1" ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

exit $res

