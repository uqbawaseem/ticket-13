Rails.application.routes.draw do
  root 'homes#index'
  resources :products, :suggestions

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
 end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
