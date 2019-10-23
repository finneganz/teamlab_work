Rails.application.routes.draw do

  root 'static_page#index'
  get '/about' => 'static_page#about', as: :about
  get '/help' => 'static_page#help', as: :help
  get '/contact' => 'static_page#contact', as: :contact

  get '/topic'  =>  'topics#index' , as: :topic_index
  get '/topic/newtopic' => 'topics#new' , as: :topic_form
  post '/topic/newtopic' => 'topics#create' , as: :topic_create
  get '/topic/:id' => 'topics#show' , as: :topic_show
  resources :posts

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
