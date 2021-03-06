Rails.application.routes.draw do
  root 'homes#index'
  resources :products do
    resources :suggestions
  end
  

  devise_for :users, :controllers => { 
    :omniauth_callbacks => "callbacks",
     sessions: 'users/sessions' 
    }

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy' 
    resources :suggestions

 end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
