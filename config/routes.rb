Rails.application.routes.draw do
  namespace :admin do
    get 'sessions/new'
  end

  namespace :admin do
    get 'categories/index'
  end

  namespace :admin do
    get 'categories/new'
  end

  get 'static_pages/about'

  get 'static_pages/help'

  devise_for :users
  root 'products#index'

  namespace :admin do
    root 'sessions#new'
    resources :products
    resources :categories
    resources :orders do
      member do
        post :cancel
        post :ship
        post :shipped
        post :return
      end
    end
  end

  namespace :account do
    resources :orders
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  resources :cart_items

  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      post :apply_to_cancel
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
