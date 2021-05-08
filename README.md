# README

## 紹介
掌田津耶乃著の『Ruby on Rails 6 超入門』で勉強する用のリポジトリ<br><br>

## やったこと

### HELLOコントローラ
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

* `[index14]` 選択リストで複数選択
    ```
        <%= select_tag(《ID》, options_for_select(配列), {size:行数, multiple:複数選択可能にするならtrue, class:"クラス名"} )) %>
    ```

<br>

* `[index15]` オリジナルのレイアウトを適用
    1. メインのレイアウトを作る(`/app/views/layouts/hello.html.erb`)
    2. ヘッダーとフッターを作る(`/app/views/layouts/hello_header.html.erb`, `/app/views/layouts/hello_footer.html.erb`)
    3. コントローラでアクション宣言前に`layout hello`を記述するとデフォルトの`/app/views/layouts/application.html.erb`ではなく, `/app/views/layouts/hello.html.erb`を参照するようになる

<br> <br>
### msgboardコントローラ

* コントローラの作成
    ```
        rails generate controller msgboard index
    ```

* テキストフィールドに入力されたものを`data.txt`に保存して, 24時間以内に投稿されたもののみ表示する. データの形式は`JSON`


### peopleコントローラ

* モデルの作成
    ```
    $ rails generate model person name:text age:integer mail:text
    Running via Spring preloader in process 9427
        invoke  active_record
        create    db/migrate/20210508100209_create_people.rb
        create    app/models/person.rb
        invoke    test_unit
        create      test/models/person_test.rb
        create      test/fixtures/people.yml


    $ rails db:migrate
    == 20210508100209 CreatePeople: migrating =====================================
    -- create_table(:people)
    -> 0.0030s
    == 20210508100209 CreatePeople: migrated (0.0031s) ============================
    ```

* モデルにデータ(シード)を追加. `db/seeds.txt`
    ```
    Person.create(name:"taro", age:38, mail:"taro@t")
    Person.create(name:"hanako", age:24, mail:"hanako@h")
    ```

* `people`コントローラを作成

* `[index1]`


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

<br>

* フォームヘルパーの他のやつ
    * テキストエリア(複数行のテキスト) 
        ```
        <%= text_area_tag( 名前, "初期テキスト", size: "文字数x行数") %>
        ```
    
    * パスワード入力
        ```
        <%= password_field_tag( 名前 ) %>
        ```

    * 非表示フィールド
        ```
        <%= hidden_field_tag( 名前, 値 ) %>
        ```

    * 検索フィールド
        ```
        <%= search_field( 名前 ) %>
        ```

    * 電話番号の入力
        ```
        <%= telephone_field( 名前 ) %>
        ```

    * 日時に関する入力
        ```
        <%= date_field( 名前 ) %>
        <%= datetime_local_field( 名前 ) %>
        <%= time_field( 名前 ) %>
        <%= month_field( 名前 ) %>
        <%= week_field( 名前 ) %>
        ```

    * URL入力
        ```
        <%= url_field( 名前 ) %>
        ```

    * メールアドレスの入力
        ```
        <%= email_field( 名前 ) %>
        ```

    * 色の選択
        ```
        <%= color_field( 名前 ) %>
        ```
    
    * 指定範囲の数値の入力
        ```
        <%= number_field( 名前,  初期値, in: 最小値..最大値, step: ステップ数 ) %>
        <%= range_field( 名前,  初期値, in: 最小値..最大値) %>
        ```

<br>

* レイアウトするテンプレートは `/app/views/layouts/` にあり,デフォルトで3つのファイルがある
    |   |   | 
    | :--- | :--- | 
    |application.html.erb | Railsアプリケーションでデフォルトで使われるWebページのレイアウト|
    | mailer.html.erb | メール送信用に用意されたもので, <br>HTMLメールのレイアウトとして用いられる|
    | mailer.text.erb | テキストメールのレイアウトとして用いられる|

<br>

* アプリケーションコントローラのコンストラクタ(initialize)はアクセスのあるたび呼ばれるみたい

<br>

* Model
    * SQLでデータベースをきちんと利用するにはデータベースの知識が必要だが, データベース利用の面倒さを取り除くためにMVCアーキテクチャの中で考案されたのが「モデル(Model)」という考え方
    * プログラムとモデルの間をモデルのメソッドでやりとりし, モデルとデータベースの間をSQLコマンドでやりとりする
    * プログラムとモデルはプログラマが触るが, モデルとデータベースのやり取りはフレームワークがやってくれるのでプログラマは複雑なことをしなくてよくなる

<br>

* SQLデータベースをプログラムの構造から見て大きく２つの種類に分けられる
    * サーバ型
        * 一般に広く使われているデータベースプログラム
        * データベース専用のサーバでwebからデータベースサーバにアクセスしてデータを取得したりする
    * ライブラリ型
        * 単体のプログラムとして動くのではなく, 機能だけを提供するライブラリとして用意されるデータベース
        * Rubyなどの各種プログラミング言語の中から呼び出してデータベースファイルにアクセスする

* Railsではどんなデータベースサーバを使っても、書くコードは変わらない。どうして？
    * データベース固有の情報は, プログラム本体とは別の設定ファイルに切り離されているから
        * database.yml 
            * `/config`フォルダに配置されている
            * 構成は以下の通り
                ```
                default: &default
                    ....設定内容....
                development:
                    ....設定内容....
                test:
                    ....設定内容....
                production:
                    ....設定内容....
                ```
            * 各項目の役割は以下の通り
                |||
                |----|----|
                |default|すべてに共通する設定|
                |development|開発時の設定|
                |test|テスト用の設定|
                |production|正式リーリス時の設定|
            * その中で使ういくつか項目
                * adapter:
                    * データべースアクセスに使われる「アダプター」というプログラムを指定するもの
                    * 例えばSQLite3なら, 「sqlite3」
                * pool :
                    * データベースに同時にアクセス可能なユーザ数
                * timeout:
                    * データベースの結果を受け取るまでの最大待ち時間
                * <<: *default
                    * defaultに用意した設定をそのまま使うという宣言. 修正してはいけない
                * database:
                    * データベースファイルの保存場所とファイル名を指定するもの




 