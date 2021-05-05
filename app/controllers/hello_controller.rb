class HelloController < ApplicationController
    def index1
        render plain:"Hello, This is Rails sample page!"
    end

    def index2
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

        # http://localhost:3000/hello?msg=hoge
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
end
