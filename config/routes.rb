Rails.application.routes.draw do
  resources :premiacions
  get '/inboxes/new/:user_id' => "inboxes#new"
  resources :inboxes
  resources :announcements
  resources :transactions
  resources :campaments
  resources :chapters
  resources :degrees
  resources :charges
  resources :charges
  resource :passwords

  get "/update_chapters" => "admin_controller#update_chapters"
  get "/update_user_field" => "inboxes#update_user_field"

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
  post '/chapter/createAnnouncement/:id' => "announcements#createFromChapter"
  post '/campament/createAnnouncement/:id' => "announcements#createFromCampament"
  get '/asignar_grado_demolay/:id' => 'profiles#asignar_grado_demolay'
  get '/asignar_grado_chevallier/:id' => 'profiles#asignar_grado_chevallier'
  get '/asignar_grado_caballero/:id' => 'profiles#asignar_grado_caballero'
  get '/asignar_senior_demolay/:id' => 'profiles#asignar_senior_demolay'
  post '/update_asignar_grado_demolay/:id' => 'profiles#update_asignar_grado_demolay'
  post '/update_asignar_grado_caballero/:id' => 'profiles#update_asignar_grado_caballero'
  post '/update_asignar_grado_chevallier/:id' => 'profiles#update_asignar_grado_chevallier'
  post '/update_asignar_senior_demolay/:id' => 'profiles#update_asignar_senior_demolay'
  get 'campaments/gestion/:id' => "campaments#gestion"

  get '/gestion/:id' => 'chapters#gestion'
  get '/asignar_consultor/:id' => 'profiles#asignar_consultor'
  post '/update_asignar_consultor/:id' => 'profiles#update_asignar_consultor'
  post '/search' => 'admin_controller#search'
  post '/campaments/update_gestion/:id' => "campaments#update_gestion"
  get '/approvals' => 'admin_controller#approvals'
  get '/approve/:id' => 'admin_controller#approve'
  get '/reject/:id' => 'admin_controller#reject'
  post '/update_reject/:id' => 'admin_controller#update_reject'


  get '/approve_degree/:id' => 'admin_controller#approve_degree'
  get '/reject_degree/:id' => 'admin_controller#reject_degree'
  post '/update_reject_degree/:id' => 'admin_controller#update_reject_degree'
  get '/aproveTransaction/:id' => 'transactions#aproveTransaction'
  get '/pendingTransactions' => 'transactions#pendingTransactions'
  get '/aprovedTransactions' => 'transactions#aprovedTransactions'
  get '/reports' => 'transactions#reports'
  post '/generateReport' => 'transactions#generateReport'
  get '/deleteInbox/:id' => 'inboxes#deleteInbox'
  get '/chapter_aprovals' => 'admin_controller#chapter_aprovals'
  get '/aprove_publication/:id' => 'admin_controller#aprove_publication'
  get '/chapter_users/:id' => 'chapters#chapter_users'
  get '/reiniciar_gestion' => "charges#drop_gestion"
  post '/update_reiniciar_gestion' => "charges#update_drop_gestion"

end
