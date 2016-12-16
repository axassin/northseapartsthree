Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # ----------------------------- Concerns -----------------------------

  concern :search_suggestionable do
    collection do
      get :search_suggestions
    end
  end

  concern :uniqueness_validation do
    collection do
      get :uniqueness_validation
    end
  end

  # ----------------------------- Aggregated Functions -----------------------------

  def generate_logic_unit( unit )
    resources unit, concerns: [:search_suggestionable, :uniqueness_validation]
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
      namespace :contact_details do
        generate_logic_unit( :telephone_numbers )
        generate_logic_unit( :links )
        generate_logic_unit( :locations )
      end
      get 'contact_details/contactable', to: 'contact_details#contactable'
      generate_logic_unit( :contact_details )
      generate_logic_unit( :vehicles )
    end

    get 'system_accounts/get_image', to: 'system_accounts#get_image'
    generate_logic_unit( :system_accounts )

    define_index( 'accounting_and_finance' )
    namespace :accounting_and_finance do
    end

    define_index( 'human_resources' )
    namespace :human_resources do
    end

    define_index( 'operations' )
    namespace :operations do
    end

    define_index( 'strategic_marketing' )
    namespace :strategic_marketing do
    end

  end

  # ----------------------------- Developer Management and Testing -----------------------------

  namespace :development do
    get 'documentation', to: 'documentation#index'
  end

end
