Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'departments#mainpage', as: 'home'

  get 'departments/mainpage'

  get 'user_project_details/new', as: 'new'

  delete 'user_project_details/destroy'

  resources :users

  resources :departments

  resources :projects

  resources :user_project_details

end
