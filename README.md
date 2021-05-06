# README

## 紹介
掌田津耶乃著の『Ruby on Rails 6 超入門』で勉強する用のリポジトリ<br><br>

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

<br>

* `/app/config/routes.rb` にアクションのルート情報を以下のように記載
```
get "hello/index"                   // get "コントローラ名/アクション名"
get "hello" => "hello#index"        // get "アドレス" => "コントローラ名#アクション名"
```

<br>

* `/app/views/hello/index.html.erb`に HTMLを記載

<br>

* Bootstrapを使うとwebデザインをうまくやってもらえるので, 
`/app/views/layouts/application.html.erb` の`head`内に以下のタグを追加
```
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.css"> 
```
さらにbodyタグを以下のように書き換える
```
<body class="container">
```

<br>

* `[index6]` コントローラからテンプレートに値を渡して表示
```
@title = "タイトル"
```
のようにインスタンス変数を用いる. `index.html.erb`で使うときには以下のように`<%= =>`で囲む
```
<h1 class="display-1"> <%= @title%></h1>
```

<br>

* `[index7, other]` リダイレクトとパラメータの送付
```
def リダイレクト元のアクション
    redirect_to action: :アクション名, params:{・・・ハッシュ・・・}
end
```

<br>

* `[index8]` `http://localhost:3000/hello/index` に入力フォームをつけ, postで送信し, 表示。
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

<br>

* `[index9]` HTMLタグでformを書いたときは上記を使ったが, Rails本来の使い方ではない. ここで以下のようにformを作ると`protect_from_forgery`を消しても通過する
```
<%= form_tag(controller: コントローラ名, action: アクション名) do %> //<form method="POST" action="/コントローラ名/アクション名">
    <%= text_field_tag(《ID》) %>                                //<input type="text" id=《ID》>
    <%= submit_tag("Click") %>                                  //<input type="submit">
<% end %>
```

<br>

* `[index10]` フォームヘルパーで属性を設定するときには以下のようにする
```
    <%= text_field_tag(《ID》, デフォルト値, ⋯属性の設定(ハッシュ)⋯) %>
    <%= submit_tag(《ID》, ⋯属性の設定(ハッシュ)⋯) %>
```

<br>


* `[index11]` チェックボックス
```
    <%= check_box_tag(《ID》) %>
    <%= label_tag( 割り当てるID, 表示テキスト ) %>
```

<br>


* `[index12]` ラジオボタン
```
    <%= radio_button_tag(name値, value値) %> //IDは自動で{name値_value値}となる
    <%= label_tag( 割り当てるID, 表示テキスト ) %> 
```

<br>


* `[index13]` 選択リスト
```
    <%= select_tag(《ID》, options_for_select(配列))) %>
    <%= label_tag(割り当てるID, 表示テキスト) %> <br>
```


<br><br>
## メモ
* /app/views/コントローラ名/*.html.erb にはbodyの中身だけ書けばよい
<br><br>
* /app/views/コントローラ名/*.html.erb で使うスタイルシートは/app/assets/stylesheets/コントローラ名.scss にあるとわかっているのでこれも記載せずに読み込んでもらえる
<br><br>
* コントローラで 以下のように何もしなければ{アクション名}.html.erbを読み込むようになっている
```
def アクション名 
end
``` 

* GETとPOST
>普通にWebサイトにアクセスするとき、Webブラウザは「GET」という方式でアクセスしています。(中略)これに対し「POST」というのは、フォームの送信などに用いられる方式です。<br>
GETは「いつ、どこからどうアクセスしても常に同じ結果が返される」というようなものに使います。（中略）これに対しPOSTは「そのとき、その状況での表示」を行うような場合に使われます。

<br>

* CSRF(Cross Site Request Forgery) : 外部のサーバからフォームなどに送信するサイト攻撃. 外部のサーバから、フォームの送信と同じ情報を送ることでフォームの送信を偽装するというもの

<br>


* フォームヘルパーを使うとなぜCSRF対策を通過できるのか
> 普通に`<form>`タグを書くのと何が違うのでしょう。その疑問を解決するために、フォームヘルパーを使って表示されたフォームのソースコードがどうなっているか見てみましょう。(中略)なんだか見覚えのない`<inpupt type="hidden">`タグが2つ追加されているのがわかりますね。ここで、フォームに必要な情報を付け足していたのです。フォームを送信されたコントローラ側では、これらの値をチェックし、それがRailsアプリに用意されているフォームから送信されたものであることを確認してからフォーム受信の処理を行うようになっていたのです。









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
