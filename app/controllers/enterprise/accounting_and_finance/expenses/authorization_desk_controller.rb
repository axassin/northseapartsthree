class Enterprise::AccountingAndFinance::Expenses::AuthorizationDeskController < ControlDeskController

  def setup_controller
    setup_variables(@@routes.enterprise_accounting_and_finance_expenses_path,
                    @@routes.enterprise_accounting_and_finance_expenses_authorization_desk_path, 'Authorization Desk')
  end

  def index

    @start_date = params[:start_date] || Time.new.strftime('%Y-%m-%d')
    @end_date = params[:end_date] || (Time.new + 1.months).strftime('%Y-%m-%d')

    @unprocessed_expense_entry = ExpenseEntry.unprocessed(@start_date,@end_date)
    @approved_expense_entry = ExpenseEntry.approved(@start_date,@end_date)
    @denied_expense_entry = ExpenseEntry.denied(@start_date,@end_date)
  end

  def process_index
    params[:status].each do |expense_entry_id, action|
      expense_authorization = ExpenseEntry.find_by_id(expense_entry_id).expense_authorization
      expense_authorization.destroy if expense_authorization.present?
      if action == 'reinstate'
      elsif action == 'approve'
        expense_authorization = ExpenseAuthorization.new
        expense_authorization.employee = current_user.system_account.employee
        expense_authorization.expense_entry = ExpenseEntry.find_by_id(expense_entry_id)
        expense_authorization.status = 'APPROVED'
        expense_authorization.implemented_on = Date.today
        expense_authorization.save!
      elsif action == 'deny'
        expense_authorization = ExpenseAuthorization.new
        expense_authorization.employee = current_user.system_account.employee
        expense_authorization.expense_entry = ExpenseEntry.find_by_id(expense_entry_id)
        expense_authorization.status = 'DENIED'
        expense_authorization.implemented_on = Date.today
        expense_authorization.save!
      end
    end
    redirect_to :action => 'index', :start_date => params[:start_date], :end_date => params[:end_date]
  end

end
