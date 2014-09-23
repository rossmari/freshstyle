Rails.application.routes.draw do

  resources :categories
  devise_for :users
  resources :users

  namespace :admin do
    resources :users
    resources :categories do
      collection do
        get :manage
        post :rebuild
      end
    end

    resources :goods

  end

  root 'main#index'

end
