Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'departments#mainpage', as: 'home'

  get 'departments/mainpage'

  resources :users

  resources :departments

  resources :projects

end
