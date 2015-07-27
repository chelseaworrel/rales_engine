Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/customers/find', to: 'customers#find'
      get '/customers/find_all', to: 'customers#find_all'
      get '/customers/random', to: 'customers#random'
      resources :customers, except: [:new, :edit]
      resources :merchants, except: [:new, :edit]
      resources :invoices, except: [:new, :edit]
      get '/items/find', to: 'items#find'
      get '/items/find_all', to: 'items#find_all'
      get '/items/random', to: 'items#random'
      resources :items, except: [:new, :edit]
      resources :invoice_items, except: [:new, :edit]
      resources :transactions, except: [:new, :edit]
    end
  end
end
