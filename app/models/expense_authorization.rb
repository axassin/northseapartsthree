class ExpenseAuthorization < ApplicationRecord

  include GenericResourceCommon
  include Remark
  include AssociatedEmployee
  include ImplementedOn

  belongs_to :expense_entry

  setup_model('etsy',
              'employee_name',
              @@routes.enterprise_accounting_and_finance_expenses_expense_authorization_index_path,
              Enterprise::AccountingAndFinance::Expenses::ExpenseAuthorizationController )

end
