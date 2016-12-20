Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  resources :posts
  resources :categories
  root 'static_pages#home'
  get 'static_pages/about'
  get 'static_pages/contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
