Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # ----------------------------- Concerns -----------------------------
  concern :search_suggestionable do
    collection do
      get :search_suggestions
    end
  end

  # ----------------------------- Aggregated Functions -----------------------------

  def generate_logic_unit( unit )
    resources unit, concerns: [:search_suggestionable]
  end

  def define_index( indexable_controller )
    get indexable_controller, to: indexable_controller + '#index'
  end

  # ----------------------------- Front-End Website -----------------------------

  # Home Page route
  root 'front_end/home#index'
  namespace :front_end do

  end

  # ----------------------------- Enterprise Information System -----------------------------
  define_index( 'enterprise' )
  namespace :enterprise do
    define_index( 'general_management' )
    namespace :general_management do
      define_index( 'contacts' )
      namespace :contact_details do
        generate_logic_unit( :telephone_numbers )
        generate_logic_unit( :links )
        generate_logic_unit( :locations )
      end
      generate_logic_unit( :vehicles )

    end
  end

  # ----------------------------- Developer Management and Testing -----------------------------

  namespace :development do
    get 'documentation', to: 'documentation#index'
  end

end
