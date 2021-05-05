Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "hello/index"
  get "hello" => "hello#index" #helloにアクセスされたとき, helloコントローラのアクションであるindexを呼び出すということ

  get "hello/index1"
  get "hello/index2"
  get "hello/index3"
  get "hello/index4"
  get "hello/index5"
  get "hello/index6"
  get "hello/index7"
  get "hello/other"

  post "hello/index"



end
