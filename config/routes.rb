Rails.application.routes.draw do
	root "static_pages#home"
	get "/login", to: "sessions#new"
	post "/login", to: "sessions#create"
	delete "/logout", to: "sessions#destroy"
	
 	resources :users, except: :new
	get "/signup", to: "users#new"
	get "/:id/words", to: "users#words"

 
end
