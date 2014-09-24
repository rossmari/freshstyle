Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'main#index'

  devise_for :users

  resources :categories
  resources :users
  resources :pages
  resources :brands

  namespace :admin do
    root to: 'categories#index'

    resources :users
    resources :categories do
      collection do
        get :manage
        post :rebuild
      end
    end

    resources :goods
    resources :pages
    resources :brands
    resources :countries
    resources :sizes
  end
end
