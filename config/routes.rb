Rails.application.routes.draw do

  #devise_for :users
  namespace :api do
    scope module: :v1, path: 'v1' do
      resources :users
    end
  end

  namespace :api do
    scope module: :v1, path: 'v1' do
      resources :cards
    end
  end
end
