Rails.application.routes.draw do

  namespace :backoffice, path: 'app' do
    get 'settings', to: 'settings#index'

    resources :books, except: [ :show, :index ]

  end

  devise_for :users
  root to: 'backoffice/dashboard#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
