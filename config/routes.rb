Rails.application.routes.draw do
  devise_for :users, only: []
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      resources :users, only: [:show, :index] do

        scope module: :users do
          collection do
            post :sign_in, controller: :sessions, action: :create
          end
        end
      end
    end
  end
end
