# pokeコマンド
![test](https://github.com/Ingrit-24/robosys2025/actions/workflows/poke_test.yml/badge.svg)

標準入力からポケモンの英語名を読み込み、種族値を返すコマンド。

## 使い方
1. requestsのインストール
```bash
$ pip install requests
```
2. スクリプトに実行権限を付与：

```bash
$ chmod +x poke
```
3. コマンド実行例
```bash
$ echo pikachu | ./poke
35
55
40
50
50
90
```
## 必要なソフトウェア及び依存ライブラリ
- Python
  - テスト済みバージョン: 3.7〜3.12
- requests パッケージ

## テスト環境
- Ubuntu 24.04 LTS


## ライセンス
- このソフトウェアパッケージは、**三条項BSDライセンスの下**、再配布及び仕様が許可されます。
- pokeコマンドでは**三条項BSDライセンスの下で提供されるPokeAPI**を使用しています。　[PokeAPI GitHub](https://github.com/orgs/PokeAPI/repositories?type=all)
- 本プロジェクトは任天堂及びポケモン公式関係者とは無関係で、教育目的でのみ作成されています。
- @ 2025 Shogo Takizawa

