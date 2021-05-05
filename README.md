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

* `http://localhost:3000/hello/index` に入力フォームをつけ, postで送信し, 表示。
```
if request.post?
    postでアクセスされたときの処理
else 
    getでアクセスされたときの処理
end
```

ただし, CSRFの対策のためエラーになる. コントローラのクラス定義のすぐ下に以下を追記しCSRF対策を通過する
```
protect_from_forgery
```


## メモ
* /app/views/コントローラ名/*.html.erb にはbodyの中身だけ書けばよい

* /app/views/コントローラ名/*.html.erb で使うスタイルシートは/app/assets/stylesheets/コントローラ名.scss にあるとわかっているのでこれも記載せずに読み込んでもらえる

* コントローラで 以下のように何もしなければ{アクション名}.html.erbを読み込むようになっている
```
def アクション名 
end
``` 

* GETとPOST
>普通にWebサイトにアクセスするとき、Webブラウザは「GET」という方式でアクセスしています。(中略)これに対し「POST」というのは、フォームの送信などに用いられる方式です。<br>
GETは「いつ、どこからどうアクセスしても常に同じ結果が返される」というようなものに使います。（中略）これに対しPOSTは「そのとき、その状況での表示」を行うような場合に使われます。

* CSRF(Cross Site Request Forgery) : 外部のサーバからフォームなどに送信するサイト攻撃. 外部のサーバから、フォームの送信と同じ情報を送ることでフォームの送信を偽装するというもの











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
