Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'

  namespace :admin do
    get '/', to: redirect('/admin/shows')
    resources :shows
  end
end
