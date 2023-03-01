Rails.application.routes.draw do
  devise_for :users

  resources :movies do 
    resources :reviews , except:[:show, :index]
  end
  
  root "movies#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
