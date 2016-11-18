Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users
  resources :quotes, only:[:create, :destroy]
  devise_scope :user do 
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
