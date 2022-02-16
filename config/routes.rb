Rails.application.routes.draw do
  root 'homes#index'
  resources :products do
    resources :suggestions, module: :products
  end

  devise_for :users, :controllers => { 
    :omniauth_callbacks => "callbacks",
     sessions: 'users/sessions' 
    } do
      resources :suggestions, module: :users
    end

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
 end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
