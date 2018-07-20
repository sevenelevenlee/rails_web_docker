Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, path: 'auth', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  # root 'home#index'
  devise_scope :user do
    root to: "users/sessions#new"
  end
  get '/home', to: 'home#index'
  get '/home/back_index', to: 'home#back_index'

  resources :users do
    member do
      get 'edit_psd'
      patch 'update_psd'
      get 'edit_phone'
      patch 'update_phone'
      get 'oauth2_link'
      get 'oauth2_unbind'
    end
    collection do
      get 'oauth2_bind'
    end
  end
  resources :roles
  resources :audits
  resources :categories
  resources :businesses do
    member do
      get 'review_pass'
    end
    collection do
      get 'review'
    end
  end
  resources :member_categories
  resources :members do
    member do
      get 'review_pass'
    end
    collection do
      get 'review'
    end
  end
  resources :brands do
    member do
      get 'review_pass'
    end
    collection do
      get 'review'
    end
  end
  resources :product_categories
  resources :products do
    member do
      get 'review_pass'
    end
    collection do
      get 'review'
    end
  end
  resources :institutions
  resources :user_jobs
  resources :keywords do
    member do
      get 'review_pass'
    end
    collection do
      get 'review'
    end
  end
  resources :complaints
  resources :communications
  resources :supports
  resources :comments
  resources :thumbs
  resources :notices
  resources :alerts
  resources :provider_auths
  resources :positions
  resources :oauth do
    collection do
      get 'oauth2_link'
      get 'oauth2_process'
      get 'oauth2_login'
      get 'phone'
      post 'phone_login'
      get 'phone_verify_code'
      post 'phone_login_verify_code'
      get 'set_verify_code'
    end
  end
  resources :receipts do
    collection do
      post 'asyncscan_process'
    end
  end
  # add sidekiq
  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end
  mount ChinaCity::Engine => '/china_city'
  authenticate :user, ->(u) { u.roles.find_by(name: "系统管理员").present? } do
    mount ExceptionTrack::Engine => "/exception-track"
  end
  mount Ckeditor::Engine => '/ckeditor'

end
