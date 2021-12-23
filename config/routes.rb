Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles #, only: [:show, :index,:new, :create, :update, :edit, :destroy]
  get 'signup', to: 'users#new'
  resources :users , except: [:new]
end
