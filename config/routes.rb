Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # Defines the root path route ("/")
  root "home#index"

  devise_scope :user do
    authenticated :user do
      root 'welcome#index', as: :authenticated_root
      get '/mispostulaciones', to: 'postulacions#mispostulaciones'
      resources :postulacions
      resources :users
      get '/editarmicuenta', to: 'users#editarmicuenta', as: 'editarmicuenta'
      get '/welcome', to: 'welcome#index'
      resources :oferta do
        member do
          post 'solicitar'
        end
      end

    end
    unauthenticated do
      root 'home#index', as: :unauthenticated_root
      get 'home/index'
    end
  end
end
