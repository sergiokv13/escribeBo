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
  get '/asignar_maestro_consejero' => 'profiles#asignar_maestro_consejero'
  get '/asignar_chevallier' => 'profiles#asignar_chevallier'
  get '/asignar_comendador' => 'profiles#asignar_comendador'

  post '/addConsultant' => 'chapters#addConsultant'

  post '/search' => 'admin_controller#search'


end
