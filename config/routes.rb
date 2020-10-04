Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  #  Pages routes
  root 'pages#home'
  # match '/contact', to: 'pages#contact', via: 'get'

end
