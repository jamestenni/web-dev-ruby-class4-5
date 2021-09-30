Rails.application.routes.draw do
  resources :posts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'create_fast', to: 'users#create_fast'

  get 'main', to: 'main#login' 
  post 'main', to: 'main#login_check'

  get 'users_main/:id', to: 'main#user_main', as: 'user_main'

  get 'users_main/:id/posts/new', to: 'posts#create_post', as: 'user_create_post'
  post 'users_main/:id/posts/new', to: 'posts#create_post_s', as: 'user_create_post_s'

  get 'users_main/:user_id/posts/:post_id', to: 'posts#edit2', as: 'user_edit_post'
  post 'users_main/:user_id/posts/:post_id', to: 'posts#edit2_s', as: 'user_edit_post_s'

  delete 'users_main/:user_id/posts/delete/:post_id', to: 'posts#destroy2', as: 'user_delete_post'

end
