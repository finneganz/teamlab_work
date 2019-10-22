Rails.application.routes.draw do

  get 'posts/new'
  get 'topics/index'
  get 'topics/new'
  root 'static_page#index'
  get '/about' => 'static_page#about', as: :about
  get '/help' => 'static_page#help', as: :help
  get '/contact' => 'static_page#contact', as: :contact

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 
  
  devise_scope :user do
    get "user/:id", :to => "users/registrations#detail", as: :detail
    get "signup", :to => "users/registrations#new", as: :signup
    get "login", :to => "users/sessions#new", as: :login
    get "logout", :to => "users/sessions#destroy", as: :logout
  end
end
