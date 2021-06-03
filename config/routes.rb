Rails.application.routes.draw do
  
  resources :categories do
    resources :tasks , :except => [:index, :show]
  end

end
