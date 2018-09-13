Rails.application.routes.draw do
	root "static_pages#home"
	get "/login", to: "sessions#new"
	post "/login", to: "sessions#create"
	delete "/logout", to: "sessions#destroy"
	
 	resources :users, except: :new
	resources :relationships, only: [:create, :destroy]
 	
	get "/signup", to: "users#new"

	namespace :admin do
		resources :categories, shallow: true do
			resources :words
		end	
	end
 
end
