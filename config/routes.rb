Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Home Page route
  root 'home#index'

  get 'development/documentation', to: 'development#documentation'

end
