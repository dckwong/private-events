Rails.application.routes.draw do
	root 'sessions#new'

	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy'
	get '/signup', to: 'users#new'

	resources :users, only: [:show, :create]
	resources :events, only: [:new, :create, :show, :index]

end
