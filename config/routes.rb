Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
	
  # Defines the root path route ("/")
  # root "articles#index"
	
	devise_scope :user do
		get '/users/sign_out', to: 'devise/sessions#destroy'
	end
	
	authenticated :user do
		root "groups#index", as: :authenticated_root
	end

	unauthenticated :user do
		root "splash#index", as: :unauthenticated_root
	end

	resources :groups, only: [:index, :create, :new,] do
		resources :agreements, only: [:index, :create, :new]
	end

end
