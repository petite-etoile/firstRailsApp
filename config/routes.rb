Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "hello/index"
  get "hello" => "hello#index" #helloにアクセスされたとき, helloコントローラのアクションであるindexを呼び出すということ
end
