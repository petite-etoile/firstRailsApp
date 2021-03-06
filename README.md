# README

## 紹介
掌田津耶乃著の『Ruby on Rails 6 超入門』で勉強する用のリポジトリ<br><br>
掲載のコードそのままでなく, 自分なりの変更を加え, 著者の了解を得て公開しています.

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
    <%= form_tag(controller: コントローラ名, action: アクション名) do %> //<form method="POST" action="/コントローラ名/アクション名" do %>
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

<br> <br>

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

* `[index1, show]` PeopleのデータのID,Nameを表示し, Nameを表示している部分にデータを表示するページへのリンクを貼る

* `[add1]` Peopleにデータを追加するページ.
    
* ルーティング情報は,
    ```
        get "people/add"
        get "people/:id" => "people#show"
    ```
    のようにすると`people/add`にアクセスした時に `:id="add"`と判断されてしまうので,
    ```
        get "people/:id" => "people#show"
        get "people/add"
    ```
    のようにする

* リダイレクトは, 以下のどちらでも可
    ```
        redirect_to アドレス
        redirect_to action: :アクション名, params:{・・・ハッシュ・・・}
    ``` 

* `[add2]` モデルをフォームに適用する
    ```
    form_for( モデル, url:{controller: コントローラ名, action: アクション名} )
        ・・・変数.text_field などでコントロールを作成・・・
    end
    ```
    フォームヘルパーでは以下のよう
    ```
    <form class="new_person" id="new_person" action="/people/add2" accept-charset="UTF-8" method="post">
        <input type="hidden" name="authenticity_token" value=略 />
        <input class="form-control" type="text" name="person[name]" id="person_name" />
        <input class="form-control" type="text" name="person[age]" id="person_age" />
        <input class="form-control" type="text" name="person[mail]" id="person_mail" />

        <input type="submit" name="commit" value="Create Person" class="btn btn-primary" data-disable-with="Create Person" />
    </form>
    ```
    `name=person[name]`のようになっているので, 受け取ったアクションでは, `params[:person]`というところに送られたフォームの内容がハッシュとしてまとめられる.

* フォームヘルパーを使った場合,`Person.create(params[:person])`ではエラーになる(paramsのパーミッションがないから)
    以下のようにチェック済みのparamsを使ってた
    ```
    def アクション
        Person.create(person_params())
    end

    privete
    def person_params
        return params.require(:person).permit(:name, :age, :mail)
    end
    ```

* `[index2, edit, update]` データの更新
    ```
    obj = Person.find(params[:id])
    obj.update(person_params)
    ```

* ルーティング情報の設定. データ更新のためのフォーム送信は, POSTではなく「PUT」という送信方式を使っている. が, PUTは対応していない環境があるため, Railsのシステムで「PATCH」という送信方式を用意してそれを使っている. ルーティングは以下のように書く
    ```
    patch "people/update/:id" => "people/update
    ```

* `[index3, delete]` データの削除
    ```
    obj = Person.find(params[:id])
    obj.destroy()
    ```

<br><br>

### cardsコントローラ

* モデルとコントローラを作成
    ```
    $ generate model card title:text author:text price:integer publisher:text memo:text
        Running via Spring preloader in process 19586
            invoke  active_record
            create    db/migrate/20210514072203_create_cards.rb
            create    app/models/card.rb
            invoke    test_unit
            create      test/models/card_test.rb
            create      test/fixtures/cards.yml

    $ db:migrate
        == 20210514072203 CreateCards: migrating ======================================
        -- create_table(:cards)
        -> 0.0018s
        == 20210514072203 CreateCards: migrated (0.0018s) =============================


    $ generate controller cards index show add edit
        Running via Spring preloader in process 19623
            create  app/controllers/cards_controller.rb
            route  get 'cards/index'
        get 'cards/show'
        get 'cards/add'
        get 'cards/edit'
            invoke  erb
            create    app/views/cards
            create    app/views/cards/index.html.erb
            create    app/views/cards/show.html.erb
            create    app/views/cards/add.html.erb
            create    app/views/cards/edit.html.erb
            invoke  test_unit
            create    test/controllers/cards_controller_test.rb
            invoke  helper
            create    app/helpers/cards_helper.rb
            invoke    test_unit
            invoke  assets
            invoke    scss
            create      app/assets/stylesheets/cards.scss

    ```

* アクション(CRUD)
    |||
    |----|----|
    |index | `Card.all`でデータを取り出し, `@cards`に格納|
    |show  | idパラメータの値を元に`Card.find`でそのIDのデータを取り出し, `@card`に格納|
    |add   | POSTを送信された場合は`card_params`の値を元に, `Card.create`でデータを作成.<br>そうでなければ, `Card.new`で新しいインスタンスを`@card`に格納  
    |edit  | idパラメータの値を元に`Card.find`でそのIDのデータを取り出し, `@card`に保管します. POST送信されていた場合, `card_params`を引数に指定して`update`を呼, データを更新 |
    |delete|  idパラメータの値を元に, `Card.find`でそのIDのデータを取り出し, そのインスタンスの`destroy`を呼び出してデータを削除|


### peopleコントローラ　

* layoutを示すコードの中で, stylesheet_link_tagを使用. 
    ```
    <%= stylesheet_link_tag( スタイルシート名, ...属性...%>
    ```
    スタイルシートは`/app/assets/stysheets/`の中にある.<br>
    今回指定した属性
    |||
    |----|----|
    |media:"all"|<link>にmedia属性を付きあする. スタイルシートを使用するメディアやデバイスを指定するもの
    |"data-turbokinks":"reload"|元のスタイルデータの修正に応じてリロードさせるもの|

* `[find1]` idを入力してモデル名.findを使った検索

* `[find2]` where文で検索
    ```
    @変数 = モデル.where( "項目名 >= ?", 値)
    ```
* `[find3]` where文でLIKE検索
    ```
    @変数 = モデル.where( "項目名 LIKE ?", 値)
    ```
* `[find4]` find文で複数選択. 引数に配列を渡す
    ```
    f = params[:find].split(",")
    @変数 = モデル.find(f)
    ``` 

* `[find5]` データの並び順の変更
    ```
    変数 = モデル.where( 〇〇 ).order(項目名 asc ) 
    変数 = モデル.where( 〇〇 ).order(項目名 desc)
    ```

* `[find6]` データの表示数と, なんばんめから表示するか
    ```
    @変数 = モデル.all.limit(表示数).offset(何個飛ばすか))
    ```

* バリデーションを設定 `/app/models/person.rb`
    ```
    validates 項目名, ルール: 値
    ```
    |||
    |----|----|
    |presence: true  | 必須項目にする|
    |uniqueness: true| 指定した項目の値がuniqueでなければいけない|
    |numericality: true| 数字かどうかチェック|
    |numericality: {設定: 値, 設定: 値, ...}| その他設定|
    |length: {設定: 値, 設定: 値, ...}|テキストの長さをチェック|
    |inclusion: {in [A,B,...]}|配列の中に含まれた値|
    |exclusion: {in [A,B,...]}|配列の中に含まれてない値|
    |format: {with:正規表現}|正規表現を使ったパターンにマッチするかチェック|


    * `numericality`のオプション設定
        |||
        |----|----|
        |only_integer|整数|
        |greater_than|指定した値より大きい|
        |greater_than_or_equal_to|指定した値以上|
        |less_than|指定した値より小さい|
        |less_than_or_equal_to|指定した値以下|
        |equal_to|指定した値と等しい|
        |eval|偶数|
        |odd|奇数|
    * `length`のオプション設定
        |||
        |----|----|
        |maximum|最大文字数を指定|
        |minimum|最小文字数を指定|
        |is|指定の文字数|
        |within|文字数の範囲を`A..B`のように指定|
        |tokenizer|テキストを分割するためのもの. 実行する処理をラムダ式でまとめたものを値として用意|
    * 


* `[add3, create3]` アクションでバリデーションチェック
    ```
    @変数 = モデル.new(パーミットされたあれ)
    if @変数.save()
        //保存成功
    else
        //保存失敗
    end    
    ```

* `[add4, create4]` エラーメッセージの表示 
    ```
    @変数 = モデル.new(パーミットされたあれ)
    if @変数.save()
        //保存成功
    else
        //保存失敗
        @変数.errors.messages.each do |key,vals|
            //key と vals で@msgを作る
    end    
    ```
    
* `[add4, create4]` エラーメッセージを日本語に変更. `/app/models/person.rb`のvalidatesの設定の部分を以下のように変更
    ```
    validates :name, presence: {message: "は,必須項目です."}
    validates :age,  numericality: {message: "は,数字で入力してください."}
    ```

* `[add5, create5]` メッセージをコントローラで取得したりするのは不自然なので, ビュー側でメッセージを表示する.
    ```
    <%if @person.errors.any?%>
        <ul>
            <% @person.errors.full_messages.each do |err|%>
                <li><%= err %></li>
            <% end%>
        </ul>
    <% end %>
    ```
* 自作validator `/app/validator/`を作成し, `/app/validator/email_validator.rb`を用意
    ```
    class EmailValidator < ActiveModel::EachValidator
        def validate_each(record, attribute, value)
            unless value =~ /\A([^p\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
                record.errors[attribute] << (options[:message] || "is not an email") 
            end
        end
    end
    ```
    `/app/models/person.rb`でemailのvalidateを追加
    ```
    validates :mail,  email: {message: "はメールアドレスではありません"}
    ```

### Messageモデル
* Messageモデルの作成
    ```
    $ rails generate model message person_id:integer title:text message:text

    $ rails db:migrate
    ```

* Messageモデルのvalidate `/app/models/messages.rb`
    ```
    class Message < ApplicationRecord
        validates :message, presence: {message:"をかいてください"}
    end
    ```

*  コントローラの作成
    ```
    rails generate controller messages index show add edit
    ```
    

* まず, index, add, show, edit, delete をpersonコントローラと同様に作成する

### Personモデル

* has_oneアソシエーションの基本「has_one」を使ってみる(has_oneは　主データ一つに従データが一つ関連づけられる　というもの)
    * Personモデルを主, Messageモデルを従とする(`/app/models/person.rb`)
        ```
            has_one :message
        ```
    * personのshowページでそのPersonが投稿したMessageのタイトルを一つ表示する(`app/views/people/show2.html.erb`)

* has_manyアソシエーション
    * 1対多 (`/app/models/person.rb`)
        ```
            has_many :message
        ```
    * personのshowページでそのPersonが投稿したMessageのタイトルをすべて表示する(`app/views/people/show3.html.erb`)
    
### Messageモデル
* belongs_toアソシエーション
    * 従データ側から関連づけられている主データを取り出す(`/app/models/message.rb`)
    ```
        belongs_to :person
    ```

    * messageのshowページで


### Mycontactモデル
* scaffoldでCRUD部分を作成
    ```
    
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

* 新しいMVCを作る流れ
    1. テーブルの設計
        * データベースを利用するアプリをつくるとき, 最初に「データベース設計」を考える. 
        * どのようなデータをどういう形で保存していけばいいかを考え, 用意しておくべきテーブルの仕様を決める
    2. モデルの設計
    3. コントローラとビューの作成
    4. 処理とテンプレートを作成
        * 書くアクションの処理とテンプレートを並行して作成していく
        *  コントローラ全体を一度に作ろうとせず, 1つ1つのアクションごとに必要な処理を整理しながらプログラミングしていく
    5. その他残りを作成
        * スタイルシートやルーティング設定など

    * データベースの設計を

* コントローラはモデルの複数形の名前にするのが一般的

* モデルの基本メソッド
    |||
    |----|----|
    |all    |すべてのデータを取り出す|
    |find   |ID番号を引数に指定すると, そのデータを取り出す|
    |create |データを引数に指定すると, そのデータを作成する|
    |update |データを引数に指定すると, その内容にデータを更新する|
    |destroy|データを削除する|

* モデル利用の手順
    1. `rails generate model`を使って作成
    2. マイグレーションの実行 `rails db:migrate`を使う
    3. シードの実行 `rails db:seed`を使う

* モデル保存はフォームヘルパーを使う
    * フォーム送信された値はパーミッションの処理をしないとうまく保存できない

* モデルは細かな点で「これを忘れると動かない」がある
    * マイグレーション
    * パーミッション
    * ルーティングのPATCH


* バリデーションとは
    * モデルを保存しようとするときに, それぞれの項目の値が正しく設定されているかをチェックするための仕組み
    * 保存する際に自動的にバリデーションが実行されるようになっている.

* ` create3`で`@person`をもとにフォームに表示する
    * 今回, 間違った値を書いて送信すると, メッセージが表示されて保存されない.
    * しかし, フォームの各項目には先に送信した値がそのまま表示されている
        * `Person.new(person_params())`で作成したインスタンスがそのまま`@person`に設定されていたため, フォームにppersonが設定されて, その値が各フィールドに値として表示された
    * バリデーションはチェックで再入力になった場合も, 作成してあったモデルオブジェクトがそのままフォームに設定され項目に値が表示される
        * だから, できるだけフォームヘルパーでモデルインスタンスを`form_for`に設定して使うべき