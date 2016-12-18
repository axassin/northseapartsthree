Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # ----------------------------- Concerns -----------------------------

  def declare_concern( concern_name )
    concern concern_name do
      collection do
        get concern_name
      end
    end
  end

  declare_concern( :search_suggestion )
  declare_concern( :uniqueness_validation )
  declare_concern( :retrieve_resource )

  # ----------------------------- Aggregated Functions -----------------------------

  def generate_logic_unit( unit )
    resources unit, concerns: [:search_suggestion, :uniqueness_validation, :retrieve_resource]
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
        resources :contact_wizard
        generate_logic_unit( :telephone_numbers )
        generate_logic_unit( :links )
        generate_logic_unit( :locations )
      end
      get 'contact_details/contactable', to: 'contact_details#contactable'
      generate_logic_unit( :contact_details )
      generate_logic_unit( :vehicles )
    end

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
