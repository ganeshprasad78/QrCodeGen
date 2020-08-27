Rails.application.routes.draw do
  devise_for :users
  resources :products do
  	member do
      get :print
  	  put :generate_qr_code, :production_assign, :print_assign, :marketing_assign, :authenticate_pin
  	end
  end

  resources :master_lists
  resources :roles
  scope '/admin'  do 
  	resources :users
  end
  root to: 'products#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
