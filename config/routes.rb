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
            put :change_password
          end

          resources :appointments, only: [:index, :show, :create] do
            member do
              post :cancel
            end
          end
        end
      end
    end
  end

  resources :users, only: [:index, :show, :new, :create] do

    resources :appointments, only: [] do
      member do
        put :confirm
        put :cancel
      end
    end
  end

  resources :appointments, only: [:index]

  root 'appointments#index'
end
