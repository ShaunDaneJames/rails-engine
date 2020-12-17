Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do

      namespace :items do
        get '/:id/merchants', to: 'search#show'
      end
      resources :items

      namespace :merchants do
        get '/:id/items', to: 'search#index'
      end
      resources :merchants
    end
  end
end
