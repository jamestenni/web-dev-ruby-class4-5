Rails.application.routes.draw do
  resources :posts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'create_fast', to: 'users#create_fast'

  get 'main', to: 'main#login' 
  post 'main', to: 'main#login_check'

  get 'user_main/:id', to: 'main#user_main', as: 'user_main'
  get 'user_main/:id/create_post', to: 'posts#create_post'
  post 'user_main/:id/create_post', to: 'posts#create_post_s'

  get 'user_main/:user_id/edit_post/:post_id', to: 'posts#edit2', as: 'user_edit_post'
  post 'user_main/:user_id/edit_post/:post_id', to: 'posts#edit2_s', as: 'user_edit_post_s'

  delete 'user_main/:user_id/delete_post/:post_id', to: 'posts#destroy2', as: 'user_delete_post'

end
