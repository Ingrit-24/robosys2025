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
status=$?
[ "$status" = "0" ] || ng "$LINENO"

for i in $(seq 0 5); do
        [ "${arr_1[$i]}" == "${expected[$i]}" ] || ng "$LINENO"
done

sleep 2

#すべて大文字
readarray -t arr_2 < <(echo GARCHOMP | ./poke)
status=$?
[ "$status" = "0" ] || ng "$LINENO"

for i in $(seq 0 5); do
        [ "${arr_2[$i]}" == "${expected[$i]}" ] || ng "$LINENO"
done

sleep 2

#一文字目のみ大文字
readarray -t arr_3 < <(echo Garchomp | ./poke)
status=$?
[ "$status" = "0" ] || ng "$LINENO"

for i in $(seq 0 5); do
        [ "${arr_3[$i]}" == "${expected[$i]}" ] || ng "$LINENO"
done

sleep 2

#大文字ランダム
readarray -t arr_4 < <(echo GarChoMp | ./poke)
status=$?
[ "$status" = "0" ] || ng "$LINENO"

for i in $(seq 0 5); do
        [ "${arr_4[$i]}" == "${expected[$i]}" ] || ng "$LINENO"
done

sleep 2

#空白の正しい処理確認
readarray -t arr_5 < <(echo garchomp                   | ./poke)
status=$?
[ "$status" = "0" ] || ng "$LINENO"

for i in $(seq 0 5); do
        [ "${arr_5[$i]}" == "${expected[$i]}" ] || ng "$LINENO"
done

sleep 2

#違うポケモンについも確認
expected_2=(35 55 40 50 50 90)
readarray -t arr_5 < <(echo pikachu  | ./poke)
status=$?
[ "$status" = "0" ] || ng "$LINENO"
for i in $(seq 0 5); do
        [ "${arr_5[$i]}" == "${expected_2[$i]}" ] || ng "$LINENO"
done

#存在しないなまえ
out=$(echo hoge | ./poke)
status=$?
[ "$status" = "1" ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

#何もない
out=$(echo | ./poke )
status=$?
[ "$status" = "1" ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

exit $res

