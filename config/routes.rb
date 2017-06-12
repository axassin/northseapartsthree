# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do

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
  def generic_resource( unit )
    resources unit, concerns: [:search_suggestion, :uniqueness_validation, :retrieve_resource]
  end

  # used for generic generic_field or dashboard
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

  def control_desk(indexable_controller)
    get indexable_controller, to: indexable_controller + '#index'
    get indexable_controller + '/process_index', to: indexable_controller + '#process_index'
  end

  def report(indexable_controller)
    get indexable_controller, to: indexable_controller + '#index'
    get indexable_controller + '/process_report', to: indexable_controller + '#process_report'
  end

  # ----------------------------- Front-End Website -----------------------------

  # Home Page route
  root 'front_end/home#index'
  namespace :front_end do

  end

  # ---------------------- Devise Authentication System ----------------
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      confirmations: 'users/confirmations',
      mailer: 'users/mailer',
      passwords: 'users/passwords',
      registrations: 'users/registrations',
      unlocks: 'users/unlocks'
  }

  # ----------------------------- Enterprise Information System -----------------------------
  define_index( 'enterprise' )
  namespace :enterprise do

    define_index( 'control_panel' )
    namespace :control_panel do

    end

    define_index('system_administration')
    namespace :system_administration do

      define_index('permissions')
      namespace :permissions do
        generic_resource( :access_permissions )
        generic_resource( :resource_permissions )
      end

    end

    define_index( 'general_management' )
    namespace :general_management do

      generic_resource( :contact_details )
      namespace :contact_details do
        wizard('contact_wizard')
        generic_resource( :telephone_numbers )
        generic_resource( :links )
        generic_resource( :locations )
      end

      generate_action_url('contact_details','contactable')
      generic_resource( :vehicles )
      generic_resource( :branches )
      generic_resource( :system_accounts )
      generic_resource( :system_constants )
      generic_resource( :associated_files )
      generic_resource( :associated_images )
      generic_resource( :users )

    end

    define_index( 'accounting_and_finance' )
    namespace :accounting_and_finance do

      report( 'vendors_report' )
      namespace :vendors_report do
        wizard('create_vendor_wizard')
        generic_resource( :vendors )
      end

      report( 'financial_institutions' )
      namespace :financial_institutions do
        wizard('create_bank_wizard')
        generic_resource( :banks )
        generic_resource( :bank_accounts )
      end

      report('due_checks')
      generic_resource( :exchange_media )
      namespace :exchange_media do
        generic_resource(:cashes)
        generic_resource(:checks)
        generic_resource(:bank_transfers)
      end

      define_index('payments_report')
      namespace :payments_report do
        generic_resource( :payments )
        wizard('accounts_payable_wizard')
      end

      define_index( 'expenses' )
      namespace :expenses do
        generic_resource( :expense_categories )
        generic_resource( :expense_entries )
        generic_resource( :expense_assignments )
        generic_resource( :expense_authorization )
        define_index( 'expense_report' )
        define_index( 'examine_expense' )
        define_index( 'asset_expenditures' )
        control_desk( 'authorization_desk' )
        wizard( 'request_expense_wizard' )
        wizard( 'express_expense_wizard' )
      end

    end

    define_index( 'human_resources' )
    namespace :human_resources do
      define_index( 'employee_accounts_management' )
      namespace :employee_accounts_management do
        wizard('new_employee_wizard')
        generic_resource( :employee_statuses )
        generic_resource( :employees )
        generic_resource( :biodata )
      end

      report('attendance')
      namespace :attendance do
        generate_action_url('employee_attendance_report','get_regular_work_period')
        generate_action_url('employee_attendance_report','get_attendance_records')
        generate_action_url('employee_attendance_report','get_full_calendar_data')
        define_index( 'employee_attendance_report' )
        generate_action_url('rest_days','unique_rest_day_per_employee')
        generic_resource( :rest_days )
        generate_action_url('regular_work_periods','validate_overlap')
        generic_resource( :regular_work_periods )
        generate_action_url('holidays','unique_holiday_date')
        generic_resource( :holidays )
        generate_action_url('attendance_records','validate_overlap')
        generic_resource( :attendance_records )
        define_index('printable_attendance_sheet')
      end

      define_index( 'payroll' )
      namespace :payroll do
        generic_resource( :day_schemes )
        define_index( 'vales_management' )
        namespace :vales_management do
          generic_resource( :vales )
          generic_resource( :vale_adjustments )
        end
      end

    end

    define_index( 'operations' )
    namespace :operations do

      define_index('greco_warehouse')
      generate_action_url( 'greco_warehouse','greco_transaction_history' )
      generate_action_url( 'greco_warehouse','greco_current_stock_report' )
      generate_action_url( 'greco_warehouse','greco_out_of_stock_report' )

      namespace :greco_warehouse do
        generic_resource( :greco_items )
        generate_action_url( 'greco_transactions','last_transactions' )
        generic_resource( :greco_transactions )

      end

      define_index('storage_management')
      namespace :storage_management do
        define_index('storage_generator')
        generate_action_url( 'storage_generator','create' )
        generate_action_url( 'storage_management','generate_storage_units' )
        generic_resource( :storage_units )
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
