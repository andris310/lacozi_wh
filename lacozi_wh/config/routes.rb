LacoziWh::Application.routes.draw do

  resources :categories


  resources :products


root :to => 'products#home'
get '/all-products', :to => 'products#index'


end
