Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do

      namespace :items do
        get '/:id/merchants', to: 'search#show'
        get '/find_all', to: 'find#index'
        get '/find', to: 'find#show'
      end
      resources :items

      namespace :merchants do
        get '/most_revenue', to: 'revenue#index'
        get '/most_items', to: 'sold#index'
        get '/:id/items', to: 'search#index'
        get '/find_all', to: 'find#index'
        get '/find', to: 'find#show'
      end
      resources :merchants
    end
  end
end
