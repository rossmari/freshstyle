Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root to: 'main#index'

  devise_for :users, path: :admin

  resources :categories do
    resources :goods
  end
  resources :users
  resources :pages
  resources :brands
  resources :goods

  resources :baskets
  resources :orders
  resources :feedbacks
  resources :back_calls
  resources :client_messages

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
    resources :pages do
      post :update_row_order, on: :collection
    end
    resources :brands
    resources :countries
    resources :sizes
    resources :good_images
    resources :orders
    resources :carousels do
      member do
        get :crop
      end
    end
    resources :main_offers

  end
end
