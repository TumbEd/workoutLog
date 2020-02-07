Rails.application.routes.draw do
  get '/auth/facebook/callback', to: redirect('/')
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
	resources :workouts do
		resources :exercises
	end
	root 'workouts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
