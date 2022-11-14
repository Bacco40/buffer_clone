Rails.application.routes.draw do
  # GET homepage
  root to: 'main#index'

  # GET /about
  get '/about-us', to: 'about#index', as: :about

end
