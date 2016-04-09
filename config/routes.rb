Rails.application.routes.draw do
  root 'posts#home'

  get 'about' => 'posts#about'
  get 'disclosure' => 'posts#disclosure'

  resources :categories
  resources :posts
end
