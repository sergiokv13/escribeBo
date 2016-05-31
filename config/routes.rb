Rails.application.routes.draw do
  resources :announcements
  resources :transactions
  resources :campaments
  resources :chapters
  resources :degrees
  resources :charges
  resources :charges
  resource :passwords

  get "/update_chapters" => "admin_controller#update_chapters"

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
  post '/update_gestion/:id' => "chapters#update_gestion"
  get '/profile/:id' => 'profiles#profile'

  get '/asignar_grado_demolay/:id' => 'profiles#asignar_grado_demolay'
  get '/asignar_grado_chevallier/:id' => 'profiles#asignar_grado_chevallier'
  get '/asignar_grado_caballero/:id' => 'profiles#asignar_grado_caballero'
  post '/update_asignar_grado_demolay/:id' => 'profiles#update_asignar_grado_demolay'
  post '/update_asignar_grado_caballero/:id' => 'profiles#update_asignar_grado_caballero'
  post '/update_asignar_grado_chevallier/:id' => 'profiles#update_asignar_grado_chevallier'
  get 'campaments/gestion/:id' => "campaments#gestion"

  get '/gestion/:id' => 'chapters#gestion'
  get '/asignar_consultor/:id' => 'profiles#asignar_consultor'
  post '/update_asignar_consultor/:id' => 'profiles#update_asignar_consultor'
  post '/search' => 'admin_controller#search'
  post '/campaments/update_gestion/:id' => "campaments#update_gestion"
  get '/approvals' => 'admin_controller#approvals'
  get '/approve/:id' => 'admin_controller#approve'
  get '/approve_degree/:id' => 'admin_controller#approve_degree'
  get '/aproveTransaction/:id' => 'transactions#aproveTransaction'
  get '/pendingTransactions' => 'transactions#pendingTransactions'
  get '/aprovedTransactions' => 'transactions#aprovedTransactions'
  get '/reports' => 'transactions#reports'
  post '/generateReport' => 'transactions#generateReport'

end
