Rails.application.routes.draw do

  devise_for :users
  root 'tasks#daily'
  
  resources :categories do
    resources :tasks , :except => [:index]
  end

end
