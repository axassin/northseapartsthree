Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # ----------------------------- Customer Extranet -----------------------------

  # Home Page route
  root 'home#index'
  get 'development/', to: 'development#index'
  get 'development/documentation', to: 'development#documentation'

  # ----------------------------- Enterprise Information System -----------------------------
  namespace :enterprise do
    namespace :general_management do
      get 'contacts', to: 'contacts#index'
    end
  end

end
