class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include Rails.application.routes.url_helpers
  @@routes = Rails.application.routes.url_helpers

  cattr_accessor :current
  before_filter { ApplicationController.current = self }
  after_filter  { ApplicationController.current = nil  }

  before_action :setup_application_controller

  def setup_application_controller

    # array used to define menu options
    # first element of array is a hash; defines name of class and parent of class
    # second is an array of arrays, [ icon, routes, name, subdirectory ]
    @main_enterprise_array = [
        [{:enterprise => 'enterprise'},[
            ['info',enterprise_human_resources_path,'human_resources',true],
            ['info',enterprise_accounting_and_finance_path,'accounting_and_finance',true],
            ['info',enterprise_general_management_path,'general_management',true],
            ['info',enterprise_operations_path,'operations',true],
            ['info',enterprise_strategic_marketing_path,'strategic_marketing',true],
            ['info',enterprise_system_administration_path,'system_administration',true]]],
        [{:accounting_and_finance => 'enterprise'},[
            ['info', enterprise_accounting_and_finance_financial_institutions_path, 'financial_institutions', true],
            ['info', enterprise_accounting_and_finance_expenses_path, 'expenses', true],
            ['info', enterprise_accounting_and_finance_payments_report_path, 'payment_report', true],
            ['info', enterprise_accounting_and_finance_balance_of_accounts_path, 'balance_of_accounts', true],
            [ExchangeMedium.glyphicon, enterprise_accounting_and_finance_exchange_media_path, 'exchange_media', true],
            Vendor]],
        [{:financial_institutions => 'accounting_and_finance'},[
            Bank,
            BankAccount]],
        [{:payment_report => 'accounting_and_finance'},[
            Payment,
            ['info', enterprise_accounting_and_finance_payments_report_accounts_payable_wizard_index_path, 'accounts_payable_wizard', false]]],
        [{:exchange_media => 'accounting_and_finance'},[
            BankTransfer,
            Cash,
            Check]],
        [{:expenses => 'accounting_and_finance'},[
            ExpenseAssignment,
            ExpenseCategory,
            ExpenseEntry,
            ExpenseAuthorization,
            ['info',enterprise_accounting_and_finance_expenses_expense_report_path,'Expense Report',false],
            ['info',enterprise_accounting_and_finance_expenses_examine_expense_path,'Specific Expense Report',false],
            ['info',enterprise_accounting_and_finance_expenses_asset_expenditures_path,'Asset Expenditures',false],
            ['info',enterprise_accounting_and_finance_expenses_authorization_desk_path,'Authorization Desk',false],
            ['info',enterprise_accounting_and_finance_expenses_request_expense_wizard_index_path,'Request for Expense',false],
            ['info',enterprise_accounting_and_finance_expenses_express_expense_wizard_index_path,'Express Expense',false]]],
        [{:accounting_and_finance => 'enterprise'},[
            ['info',enterprise_operations_greco_warehouse_path,'greco_warehouse',true],
            ['info',enterprise_operations_storage_management_path,'storage_management',true]]],
        [{:greco_warehouse => 'operations'},[
            GrecoItem,
            GrecoTransaction,
            ['info',enterprise_operations_greco_warehouse_greco_current_stock_report_path,'Current Stock Report',false],
            ['info',enterprise_operations_greco_warehouse_greco_out_of_stock_report_path,'Out of Stock Report',false]]],
        [{:human_resources => 'enterprise'},[
            ['info', enterprise_human_resources_employee_accounts_management_path, 'employee_accounts_management', true],
            ['info', enterprise_human_resources_attendance_path, 'attendance', true],
            ['info', enterprise_human_resources_payroll_path, 'payroll', true]]],
        [{:exchange_media => 'accounting_and_finance'},[
            ['info', enterprise_human_resources_employee_accounts_management_new_employee_wizard_index_path, 'new_employee_wizard', nil],
            EmployeeStatus,
            Employee,
            Biodatum]],
        [{:attendance => 'human_resources'},[
            ['info', enterprise_human_resources_attendance_employee_attendance_report_path, 'employee_attendance_report', nil],
            RestDay,
            RegularWorkPeriod,
            Holiday,
            AttendanceRecord]],
        [{:payroll => 'human_resources'},[
            DayScheme,
            ['info', enterprise_human_resources_payroll_vales_management_path, 'vales_management', nil]]],
        [{:vales_management => 'payroll'},[
            Vale,
            ValeAdjustment]],
        [{:general_management => 'enterprise'},[
            [ContactDetail.glyphicon, enterprise_general_management_contact_details_path, 'contact_details', true],
            Vehicle,
            Branch,
            SystemAccount,
            SystemConstant,
            AssociatedFile,
            AssociatedImage]],
        [{:contact_details => 'general_management'},[
            ['gg', enterprise_general_management_contact_details_contact_wizard_index_path, 'contact_wizard', nil],
            TelephoneNumber,
            Location,
            Link]]
    ]

  end

end