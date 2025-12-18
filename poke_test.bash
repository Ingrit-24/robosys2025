#!/usr/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Shogo Takizawa
# SPDX-License-Identifier: BSD-3-Clause

ng(){
	echo ${1}行目が違う
	res=1
}
res=0

expected=(108 130 95 80 85 102)

#すべて小文字
readarray -t arr_1 < <(echo garchomp | ./poke)
for i in $(seq 0 5); do
        [ "${arr_1[$i]}" == "${expected[$i]}" ] || ng "$LINENO"
done

#すべて大文字
readarray -t arr_2 < <(echo GARCHOMP | ./poke)
for i in $(seq 0 5); do
        [ "${arr_2[$i]}" == "${expected[$i]}" ] || ng "$LINENO"
done

#一文字目のみ大文字
readarray -t arr_3 < <(echo Garchomp | ./poke)
for i in $(seq 0 5); do
        [ "${arr_3[$i]}" == "${expected[$i]}" ] || ng "$LINENO"
done

#大文字ランダム
readarray -t arr_4 < <(echo GarChoMp | ./poke)
for i in $(seq 0 5); do
        [ "${arr_4[$i]}" == "${expected[$i]}" ] || ng "$LINENO"
done

#空白の多々しい処理確認
readarray -t arr_5 < <(echo garchomp                   | ./poke)
for i in $(seq 0 5); do
        [ "${arr_5[$i]}" == "${expected[$i]}" ] || ng "$LINENO"
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

