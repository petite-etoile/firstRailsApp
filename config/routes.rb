Rails.application.routes.draw do
  get 'cards/index'
  get 'cards/show'
  get 'cards/add'
  get 'cards/edit'

  post "cards/add"
  get "cards/delete/:id" => "cards#delete"
  get "cards/edit/:id" => "cards#edit"
  patch "cards/edit/:id" => "cards#edit"
  # post "cards/delete/:id" => "cards#delete"




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
  get 'people/index1'
  get 'people/index2'
  get 'people/index3'
  get 'people' => "people#index"
  
  get  "people/add"
  post "people/add" => "people#create"
  get  "people/add1"
  post "people/add1" => "people#create1"
  get  "people/add2"
  post "people/add2" => "people#create2"

  get "people/edit/:id" => "people#edit"
  patch "people/update/:id" => "people#update"
  
  get "people/delete/:id" => "people#delete"

  
  get 'people/:id' => "people#show"



end
