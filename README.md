## 2018年エンジニアリング研修のアプリ課題

これは、[WebApp課題](https://github.com/litalico-engineering/li.jinlan.webapp/wiki/WebApp%E8%AA%B2%E9%A1%8C)として作った、ウェブの通販サイトです。   
made by [Kinran Lee](https://github.com/likinran).


## バージョン

* Ruby version 2.2.5

* Rails version 5.1.6


## 使い方

このアプリケーションを動かす場合は、まずはリポジトリを手元にクローンしてください。
その後、次のコマンドで必要になる RubyGems をインストールします。

```
$ bundle install --without production
```

その後、データベースへのマイグレーションを実行します。

```
$ rails db:migrate
```

最後に、テストを実行してうまく動いているかどうか確認してください。

```
$ rails test
```

テストが無事に通ったら、Railsサーバーを立ち上げる準備が整っているはずです。

```
$ rails server
```

詳しくは、[*Ruby on Rails チュートリアル*](https://railstutorial.jp/)を参考にしてください。
