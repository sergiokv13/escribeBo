Rails.application.routes.draw do
  resources :chapters
  resources :degrees
  resources :charges
  resources :charges
  resource :passwords

  get 'home/index'

  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  get '/newUser' => "admin_controller#newUser"
  post '/createUser' => "admin_controller#createUser"
  get '/users' => "admin_controller#users"

  get '/profile/:id' => 'profiles#profile'
  get '/asignar_grado_demolay' => 'profiles#asignar_grado_demolay'
  get '/asignar_grado_chevallier' => 'profiles#asignar_grado_chevallier'
  get '/asignar_grado_caballero' => 'profiles#asignar_grado_caballero'

  post '/addConsultant' => 'chapters#addConsultant'

  post '/search' => 'admin_controller#search'

  get '/approvals' => 'admin_controller#approvals'
  get '/approve/:id' => 'admin_controller#approve'

end
