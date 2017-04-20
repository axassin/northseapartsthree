# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users
  namespace :enterprise do
    resources :branches
  end


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

  # ----------------------------- Helpers -----------------------------

  # used for the generic CRUD interface as per model
  def generate_logic_unit( unit )
    resources unit, concerns: [:search_suggestion, :uniqueness_validation, :retrieve_resource]
  end

  # used for generic report or dashboard
  def define_index( indexable_controller )
    get indexable_controller, to: indexable_controller + '#index'
  end

  # used for wizards
  def wizard(indexable_controller)
    resources indexable_controller.to_sym
    get indexable_controller + '/restart_wizard', to: indexable_controller + '#restart_wizard'
  end

  # used for custom actions in a controller
  def generate_action_url(main_controller, action_name)
    get main_controller + '/' + action_name, to: main_controller + '#' + action_name
  end

  # ----------------------------- Front-End Website -----------------------------

  # Home Page route
  root 'front_end/home#index'
  namespace :front_end do

  end

  # ----------------------------- Enterprise Information System -----------------------------
  define_index( 'enterprise' )
  namespace :enterprise do

    define_index( 'control_panel' )
    namespace :control_panel do

    end

    define_index( 'general_management' )
    namespace :general_management do
      namespace :contact_details do
        wizard('contact_wizard')
        generate_logic_unit( :telephone_numbers )
        generate_logic_unit( :links )
        generate_logic_unit( :locations )
      end
      generate_action_url('contact_details','contactable')
      generate_logic_unit( :contact_details )
      generate_logic_unit( :vehicles )
      generate_logic_unit( :branches )
      generate_logic_unit( :system_accounts )
      generate_logic_unit( :system_constants )
      generate_logic_unit( :associated_files )
      generate_logic_unit( :associated_images )
    end

    define_index( 'accounting_and_finance' )
    namespace :accounting_and_finance do

      generate_logic_unit( :vendors )
      generate_logic_unit( :payments )

      define_index( 'financial_institutions' )
      namespace :financial_institutions do
        generate_logic_unit( :banks )
        generate_logic_unit( :bank_accounts )
      end

      namespace :exchange_media do
        generate_logic_unit(:cashes)
        generate_logic_unit(:checks)
        generate_logic_unit(:bank_transfers)
      end
      generate_logic_unit( :exchange_media )

      define_index( 'expenses' )
      namespace :expenses do
        generate_logic_unit( :expense_categories )
        generate_logic_unit( :expense_entries )
        generate_logic_unit( :expense_assignments )
      end

    end

    define_index( 'human_resources' )
    namespace :human_resources do
      define_index( 'employee_accounts_management' )
      namespace :employee_accounts_management do
        wizard('new_employee_wizard')
        generate_logic_unit( :employee_statuses )
        generate_logic_unit( :employees )
        generate_logic_unit( :biodata )
      end

      define_index( 'attendance' )
      generate_action_url('attendance','process_attendance_grid')
      namespace :attendance do
        generate_action_url('employee_attendance_report','get_regular_work_period')
        generate_action_url('employee_attendance_report','get_attendance_records')
        generate_action_url('employee_attendance_report','get_full_calendar_data')
        define_index( 'employee_attendance_report' )
        generate_action_url('rest_days','unique_rest_day_per_employee')
        generate_logic_unit( :rest_days )
        generate_action_url('regular_work_periods','validate_overlap')
        generate_logic_unit( :regular_work_periods )
        generate_action_url('holidays','unique_holiday_date')
        generate_logic_unit( :holidays )
        generate_action_url('attendance_records','validate_overlap')
        generate_logic_unit( :attendance_records )
        define_index('printable_attendance_sheet')
      end

      define_index( 'payroll' )
      namespace :payroll do
        generate_logic_unit( :day_schemes )
      end

    end

    define_index( 'operations' )
    namespace :operations do

      define_index('greco_warehouse')
      generate_action_url( 'greco_warehouse','greco_transaction_history' )
      generate_action_url( 'greco_warehouse','greco_current_stock_report' )
      generate_action_url( 'greco_warehouse','greco_out_of_stock_report' )

      namespace :greco_warehouse do
        generate_logic_unit( :greco_items )
        generate_action_url( 'greco_transactions','last_transactions' )
        generate_logic_unit( :greco_transactions )
      end

      define_index('storage_management')
      namespace :storage_management do
        generate_action_url( 'storage_management','generate_storage_units' )
        generate_logic_unit( :storage_units )
      end

    end

    define_index( 'strategic_marketing' )
    namespace :strategic_marketing do
    end

  end

  # ----------------------------- Developer Management and Testing -----------------------------

  define_index( 'development' )
  namespace :development do

    define_index( 'database_migration_initializer' )
    generate_action_url( 'database_migration_initializer','initialize_greco_inventory' )
    generate_action_url( 'database_migration_initializer','initialize_northseapartstwo_data' )

    define_index('documentation')
  end

end
