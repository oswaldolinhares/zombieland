Rails.application.routes.draw do
  constraints subdomain: 'api' do
    namespace :api, path: '/' do
      resources :survivors, only: [:create]
    end
  end
end
