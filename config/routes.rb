Rails.application.routes.draw do
  resources :posts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'create_fast', to: 'users#create_fast'

  get 'main', to: 'main#login' 
  post 'main', to: 'main#login_check'

  get 'user_main', to: 'main#user_main'

  get 'create_post', to: 'posts#create_post'
  get 'edit_post2', to: 'posts#edit2'
  post 'user_edit_post', to: 'posts#edit2_s'
  delete 'delete_post2', to: 'posts#destroy2'


  post 'user_create_post', to: 'posts#create_post_s'
end
