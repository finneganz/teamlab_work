Rails.application.routes.draw do

  # トップと静的ページ
  root 'topics#index'
  get '/about' => 'static_page#about', as: :about
  get '/help' => 'static_page#help', as: :help
  get '/contact' => 'static_page#contact', as: :contact

  # 掲示板周りのrouting
  get '/topic/newtopic' => 'topics#new' , as: :topic_form
  post '/topic/newtopic' => 'topics#create' , as: :topic_create
  get '/topic/:tpc_id' => 'topics#show' , as: :topic_show
  delete '/topic/:tpc_id' => 'topics#destroy' , as: :topic_destroy
  get '/topic/:tpc_id/edit' => 'topics#edit' , as: :topic_edit
  patch '/topic/:tpc_id/edit' => 'topics#update' , as: :topic_update
  
  # コメント周りのrouting
  get '/topic/:tpc_id/newpost' => 'posts#new' , as: :post_form
  post '/topic/:tpc_id/newpost' => 'posts#create' , as: :post_create
  delete '/topic/:tpc_id/:pst_id/delete' => 'posts#delete' , as: :post_delete
  get '/topic/:tpc_id/:pst_id/edit' => 'posts#edit' , as: :post_edit
  patch '/topic/:tpc_id/:pst_id/edit' => 'posts#update' , as: :post_update


  # devise(ユーザー周り)
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 
  
  devise_scope :user do
    get 'user/:id', :to => 'users/registrations#detail', as: :detail
    get 'signup', :to => 'users/registrations#new', as: :signup
    get 'login', :to => 'users/sessions#new', as: :login
    get 'logout', :to => 'users/sessions#destroy', as: :logout
    delete 'logout', :to => 'users/sessions#destroy'
  end

  resources :users
end
