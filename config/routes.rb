Rails.application.routes.draw do
  devise_for :users, only: []
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      resources :users, only: [] do

        scope module: :users do
          collection do
            post :sign_in, controller: :sessions, action: :create
            post :sign_out, controller: :sessions, action: :destroy
          end

          member do
            post :change_password
          end

          resources :appointments, only: [:show, :create]
        end
      end
    end
  end

  resources :users, only: [:show, :index, :new, :create]

  root 'home#index'
end
