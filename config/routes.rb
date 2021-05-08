Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "hello/index"
  get "hello" => "hello#index14" #helloにアクセスされたとき, helloコントローラのアクションであるindexを呼び出すということ

  get "hello/index1"
  get "hello/index2"
  get "hello/index3"
  get "hello/index4"
  get "hello/index5"
  get "hello/index6"
  get "hello/index7"
  get "hello/index8"
  get "hello/index9"
  get "hello/index10"
  get "hello/index11"
  get "hello/index12"
  get "hello/index13"
  get "hello/index14"
  get "hello/index15"
  get "hello/other"

  post "hello/index"
  post "hello/index8"
  post "hello/index9"
  post "hello/index10"
  post "hello/index11"
  post "hello/index12"
  post "hello/index13"
  post "hello/index14"


  
  get 'msgboard/index'
  
  get "msgboard" => "msgboard#index"
  post "msgboard" => "msgboard#index"

  get "msgboard/index"
  post "msgboard/index"


  get 'people/index'
  get 'people' => "index"
  get 'people/:id' => "people#show"




end
