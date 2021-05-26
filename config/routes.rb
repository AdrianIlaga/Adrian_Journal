Rails.application.routes.draw do
#   get '/categories' => 'categories#index', as: 'categories'
#   get '/categories/new' => 'categories#new', as: 'new_category'
#   post '/categories/new' => 'categories#create', as: 'create_category'
#   get '/categories/:id' => 'categories#show', as: 'show_category'
#   get '/categories/:id/edit' => 'categories#edit', as: 'edit_category'
#   patch '/categories/:id/edit' => 'categories#update', as: 'update_category'
#   delete '/categories/:id' => 'categories#destroy', as: 'delete_category'
  # put '/categories/:id/edit' => 'categories#update', as: 'edit_category'
  resources :categories
end
