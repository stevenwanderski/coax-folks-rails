Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  get '/calendar', to: 'pages#calendar'
  get '/shows', to: 'pages#shows'
  get '/contact', to: 'pages#contact'
  post '/contact', to: 'pages#contact_deliver'

  namespace :admin do
    get '/', to: redirect('/admin/shows')
    resources :shows
    get '/settings', to: 'settings#index'
    patch '/settings', to: 'settings#update'
    get '/account', to: 'account#index'
    patch '/account', to: 'account#update'
  end
end
