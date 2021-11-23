# このリポジトリは?

このリポジトリはTeXLive 2021でLaTeX環境を使う最低限のものを入れているものです。実際にはいろいろ必要になると思いますが、ベース部分のみをこちらに集約させています。

個人的にはこれをベースにSphinxのPDF生成バックエンドを生成したいからです。

# 作り方

```bash
$ docker buildx build --builder=YOURBUILDER --platform=linux/amd64,linux/arm64 --push -t USER/REPO[:TAG] .
```

# 使い方

`platex` などの基本的なコマンドは入ってると思います。
気になる方は`bash`を呼び出して散策してください。

# 履歴

- 2021/11/24
    - 初版

