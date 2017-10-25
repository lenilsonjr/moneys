Rails.application.routes.draw do

  namespace :backoffice, path: 'app' do
    get 'settings', to: 'settings#index'

    resources :books, except: [ :show, :index ] do
      put 'alternate'      
    end

  end

  devise_for :users, controllers: {
    registrations: 'backoffice/users/registrations'
  }
  root to: 'backoffice/dashboard#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
