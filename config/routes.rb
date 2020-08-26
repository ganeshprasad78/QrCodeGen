Rails.application.routes.draw do
  devise_for :users
  resources :products do
  	member do
  	  put :production_assign, :print_assign, :marketing_assign
  	end
  end
  resources :roles
  scope '/admin'  do 
  	resources :users
  end
  root to: 'products#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
