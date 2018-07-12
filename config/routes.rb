Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  get '/calendar', to: 'pages#calendar'
  get '/shows', to: 'pages#shows'

  namespace :admin do
    get '/', to: redirect('/admin/shows')
    resources :shows
    get '/settings', to: 'settings#index'
    patch '/settings', to: 'settings#update'
  end
end
