CraigsList::Application.routes.draw do

  # get '/' => 'categories#index'
  root to: 'categories#index'

  # if this validates call users#show
  # get '/users/login' => 'users#login'

  resources :users do
    resources :posts #:only => [:new, :create, :show, :index]
  end

  resources :categories do 
    resources :posts #:only => [:new, :create, :show, :index]
  end

end
