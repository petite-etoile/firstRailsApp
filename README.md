# README

## 紹介
掌田津耶乃著のRuby on Rails 6 超入門で勉強する用のリポジトリ

## やったこと
* プロジェクトディレクトリを作成
```
$ rails new firstApp
```
 
* コントローラhelloを作成
```
$ rails generate controller hello
``` 

* `/app/controllers/hello_controller.rb` にコントローラを記載

* `/app/config/routes.rb` にアクションのルート情報を以下のように記載
```
get "hello/index"                   // get "コントローラ名/アクション名"
get "hello" => "hello#index"        // get "アドレス" => "コントローラ名#アクション名"
```


* `/app/views/hello/index.html.erb`に HTMLを記載

* Bootstrapを使うとwebデザインをうまくやってもらえるので, 
`/app/views/layouts/application.html.erb` の`head`内に以下のタグを追加
```
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.css"> 
```
さらにbodyタグを以下のように書き換える
```
<body class="container">
```

* コントローラからテンプレートに値を渡して表示
```
@title = "タイトル"
```
のようにインスタンス変数を用いる. `index.html.erb`で使うときには以下のように`<%= =>`で囲む
```
<h1 class="display-1"> <%= @title%></h1>
```

* リダイレクトとパラメータの送付
```
def リダイレクト元のアクション
    redirect_to action: :アクション名, params:{・・・ハッシュ・・・}
end
```

## メモ
* /app/views/コントローラ名/*.html.erb にはbodyの中身だけ書けばよい
* /app/views/コントローラ名/*.html.erb で使うスタイルシートは/app/assets/stylesheets/コントローラ名.scss にあるとわかっているのでこれも記載せずに読み込んでもらえる
* コントローラで 以下のように何もしなければ{アクション名}.html.erbを読み込むようになっている

```
def アクション名 
end
``` 









<!-- 
This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ... -->
