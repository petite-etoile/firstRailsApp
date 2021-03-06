class HelloController < ApplicationController
    # protect_from_forgery #HTMLタグでフォームを書いたときの対処法

    def index1
        #http://localhost:3000/hello/index1
        render plain:"Hello, This is Rails sample page!"
    end

    def index2
        #http://localhost:3000/hello/index2
        msg = '
            <html>
            <body>
                <h1> Sample Page</h1>
                <p> This is Rails sample page! </p>
            </body>
            </html>
        '

        render html: msg #これだと、エスケープされて生のhtmlが表示される(攻撃対策)
    end

    def index3
        #http://localhost:3000/hello/index3

        msg = '
            <html>
            <body>
                <h1> Sample Page</h1>
                <p> This is Rails sample page! </p>
            </body>
            </html>
        '

        render html: msg.html_safe
    end

    def index4

        # http://localhost:3000/hello/index4?msg=hoge
        # でアクセスすると、Hello, hogeさん！となる


        if params["msg"] != nil
            msg = "Hello, #{params["msg"]}さん！" 
        else
            msg = "this is sample page"
        end

        html = "
            <html>
            <body>
                <h1> Sample Page</h1>
                <p> #{msg} </p>
            </body>
            </html>
        "

        render html: html.html_safe


    end

    def index5
        #何もかかないとデフォルトで{アクション名}.html.erbを読む
        #http://localhost:3000/hello/index5
    end

    def index6
        #http://localhost:3000/hello/index6
        @title = "View Sample"
        @msg = "コントローラに用意した値です"
    end

    def index7
        #http://localhost:3000/hello/index7 からアクセスするのと
        #http://localhost:3000/hello/other  からのリダイレクトでアクセスするのでは表示されるものが変わる
        if params["msg"] != nil
            @title = params["msg"]
        else
            @title = "index"
        end
        @msg = "this is redirect sample..."
    end

    def other
        #http://localhost:3000/hello/other
        redirect_to action: :index7, params: {"msg": "from other page"}
    end

    def index8
        #http://localhost:3000/hello/index8
        if request.post?
            @title = "Result"
            @msg = "you typed: #{params["input1"]}."
            @value = "#{params["input1"]}"
        else
            @title = "Index"
            @msg = "type text"
            @value = ""
        end
    end

    def index9
        #http://localhost:3000/hello/index9
        if request.post?
            @title = "Result"
            @msg = "you typed: #{params["input1"]}."
            @value = "#{params["input1"]}"
        else
            @title = "Index"
            @msg = "type text"
            @value = ""
        end
    end

    def index10
        #http://localhost:3000/hello/index10
        if request.post?
            @title = "Result"
            @msg = "you typed: #{params["input1"]}."
            @value = "#{params["input1"]}"
        else
            @title = "Index"
            @msg = "type text"
            @value = ""
        end
    end

    def index11
        #http://localhost:3000/hello/index11
        if request.post?
            @title = "Result"
            if params["check1"]
                @msg = "you Checked!"
            else
                @msg = "not checked."
            end
        else
            @title = "Index"
            @msg = "Check it"
        end
    end



    def index12
        #http://localhost:3000/hello/index12
        if request.post?
            @title = "Result"
            if params["r1"]
                @msg = "you selected #{params["r1"]}"
            else
                @msg = "not selected."
            end
        else
            @title = "Index"
            @msg = "select radio button it"
        end
    end

    def index13
        #http://localhost:3000/hello/index13
        if request.post?
            @title = "Result"
            if params["s1"]
                @msg = "you selected #{params["s1"]}"
            else
                @msg = "not selected."
            end
        else
            @title = "Index"
            @msg = "select radio button it"
        end
    end
    
    def index14
        #http://localhost:3000/hello/index14
        if request.post?
            @title = "Result"
            if params["s1"]
                @msg = "you selected:"
                for lang in params["s1"]
                    @msg += lang
                    puts lang

                end
            else
                @msg = "not selected."
            end
        else
            @title = "Index"
            @msg = "select radio button it"
        end
    end

    layout "hello"
    def index15
        #http://localhost:3000/hello/index15
        @header = "layout sample"
        @footer = "copyright ONO TAKAKI 2021"
        @msg = "this is simple page aaaaaaaaaaaaaaaaaaaa"
    end
end