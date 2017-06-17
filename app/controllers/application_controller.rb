class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include Rails.application.routes.url_helpers
  @@routes = Rails.application.routes.url_helpers

  cattr_accessor :current
  before_filter { ApplicationController.current = self }
  after_filter  { ApplicationController.current = nil  }

  before_action :setup_application_controller

  def setup_application_controller

    @enterprise_menu_array = [
        ['info',enterprise_human_resources_path,'human_resources',true, [
            ['info', enterprise_human_resources_employee_accounts_management_path, 'employee_accounts_management', true, [
                ['info', enterprise_human_resources_employee_accounts_management_new_employee_wizard_index_path, 'new_employee_wizard', nil],
                EmployeeStatus,
                Employee,
                Biodatum
            ]],
            ['info', enterprise_human_resources_attendance_path, 'attendance', true, [
                ['info', enterprise_human_resources_attendance_employee_attendance_report_path, 'employee_attendance_report', nil],
                RestDay,
                RegularWorkPeriod,
                Holiday,
                AttendanceRecord
            ]],
            ['info', enterprise_human_resources_payroll_path, 'payroll', true, [
                DayScheme,
                ['info', enterprise_human_resources_payroll_vales_management_path, 'vales_management', nil],
                Vale,
                ValeAdjustment
            ]]
        ]],
        ['info',enterprise_accounting_and_finance_path,'accounting_and_finance',true, [
            ['info', enterprise_accounting_and_finance_financial_institutions_path, 'financial_institutions', true, [
                Bank,
                BankAccount
            ]],
            ['info', enterprise_accounting_and_finance_expenses_path, 'expenses', true, [
                ExpenseAssignment,
                ExpenseCategory,
                ExpenseEntry,
                ExpenseAuthorization
            ]],
            [ExchangeMedium.glyphicon, enterprise_accounting_and_finance_exchange_media_path, 'exchange_media', true, [
                BankTransfer,
                Cash,
                Check,
                ['info',enterprise_accounting_and_finance_expenses_expense_report_path,'Expense Report',false],
                ['info',enterprise_accounting_and_finance_expenses_examine_expense_path,'Specific Expense Report',false],
                ['info',enterprise_accounting_and_finance_expenses_asset_expenditures_path,'Asset Expenditures',false],
                ['info',enterprise_accounting_and_finance_expenses_authorization_desk_path,'Authorization Desk',false],
                ['info',enterprise_accounting_and_finance_expenses_request_expense_wizard_index_path,'Request for Expense',false],
                ['info',enterprise_accounting_and_finance_expenses_express_expense_wizard_index_path,'Express Expense',false]
            ]],
            Vendor,
            Payment
        ]],
        ['info',enterprise_general_management_path,'general_management',true, [
            [ContactDetail.glyphicon, enterprise_general_management_contact_details_path, 'contact_details', true, [
                ['info', enterprise_general_management_contact_details_contact_wizard_index_path, 'contact_wizard', nil],
                TelephoneNumber,
                Location,
                Link
            ]],
            Vehicle,
            Branch,
            SystemAccount,
            SystemConstant,
            AssociatedFile,
            AssociatedImage
        ]],
        ['info',enterprise_operations_path,'operations',true,[
            ['info',enterprise_operations_greco_warehouse_path,'greco_warehouse',true, [
                GrecoItem,
                GrecoTransaction,
                ['info',enterprise_operations_greco_warehouse_greco_current_stock_report_path,'Current Stock Report',false],
                ['info',enterprise_operations_greco_warehouse_greco_out_of_stock_report_path,'Out of Stock Report',false]
            ]],
            ['info',enterprise_operations_storage_management_path,'storage_management',true, [
                StorageUnit,
                ['info',enterprise_operations_storage_management_storage_generator_path,'Storage Generator',nil]
            ]]
        ]],
        ['info',enterprise_strategic_marketing_path,'strategic_marketing',true,[]],
        ['info',enterprise_system_administration_path,'system_administration',true,[]],
    ]

  end

end