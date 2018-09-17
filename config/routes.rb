Rails.application.routes.draw do
	root "static_pages#home"
	get "/login", to: "sessions#new"
	post "/login", to: "sessions#create"
	delete "/logout", to: "sessions#destroy"
	get "/signup", to: "users#new"
	
 	resources :users, except: :new
	resources :relationships, only: [:create, :destroy]

 	resources :categories, only: [:index], shallow: true do
 		resources :lessons, only: [:index, :create] 
 		resources :answers, only:[:create, :new, :index]
 
 	end	

	namespace :admin do
		resources :categories, shallow: true do
			resources :words
		end	
	end
 
end
