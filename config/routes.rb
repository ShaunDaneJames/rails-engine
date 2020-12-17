Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do

      namespace :items do
        get '/:id/merchants', to: 'search#show'
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
      end
      resources :items

      namespace :merchants do
        get '/:id/items', to: 'search#index'
        get '/find', to: 'find#show'
      end
      resources :merchants
    end
  end
end
