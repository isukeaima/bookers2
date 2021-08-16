Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'homes/show' => 'homes#show'
  resources :books
  resources :users
end
