Rails.application.routes.draw do
  # GET homepage
  root to: 'main#index'

  # GET /about
  get '/about-us', to: 'about#index', as: :about

  # GET /sign-up
  get '/sign-up', to: 'register#new'

  # POST /sign-up
  post '/sign-up', to: 'register#create'

  # GET /sign-in
  get '/sign-in', to: 'session#new'

  # POST /sign-in
  post '/sign-in', to: 'session#create'

  # GET /password/edit
  get '/password', to: 'password#edit', as: :password_edit

  # PATCH /password/update
  patch '/password', to: 'password#update'

  # GET /password/reset
  get '/password/reset', to: 'password_reset#new'

  #POST /passvord/reset
  post '/password/reset', to: 'password_reset#create'

  #GET /password/reset/edit
  get '/password/reset/edit', to: 'password_reset#edit'

  #PATCH /password/reset/edit
  patch '/password/reset/edit', to: 'password_reset#update'

  #GET /auth/twitter/callback
  get '/auth/twitter/callback', to: 'omniauth_callback#twitter'

  #create all the CRUD route for '/twitter_accounts/:id'
  resources :twitter_accounts

  #create all the CRUD route or '/tweets/:id'
  resources :tweets


  # DELETE /logout
  delete '/logout', to: 'session#destroy'

end
