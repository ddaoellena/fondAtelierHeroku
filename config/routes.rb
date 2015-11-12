Rails.application.routes.draw do
	
	devise_for :users

	root "welcome#index"
	resources :annonces
	resources :categories
	get "/mes_annonces", to: "mes_annonces#index"
	get "/static/cgu", to: "static#cgu"
	get "/static/a_propos", to: "static#a_propos"

end
