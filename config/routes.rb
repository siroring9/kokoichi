Rails.application.routes.draw do
  resources :posts
  resources :crawlers do
	collection do
	  post 'run_crawler'
	end
  end

  root :to => "home#index"

  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
