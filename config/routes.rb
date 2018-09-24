Rails.application.routes.draw do
  namespace :admin do
    get 'users/index'
  end
	root "static_pages#home"
	get "/login", to: "sessions#new"
	post "/login", to: "sessions#create"
	delete "/logout", to: "sessions#destroy"
	get "/words", to: "lessons#word"
	get "/signup", to: "users#new"
	
	
	
 	resources :users, except: :new
	resources :relationships, only: [:create, :destroy]

 	resources :categories, only: [:index, :show]
	resources :lessons, only: [:index, :create], shallow: true do 
		resources :answers, only:[:create, :new, :index]

	end	

	namespace :admin do
 		resources :users, only: [:index, :update, :destroy]

		resources :categories, shallow: true do
			resources :words
		end	
	end
 
end
