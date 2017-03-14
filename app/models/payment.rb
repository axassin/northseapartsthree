class Payment < ApplicationRecord

  include GenericResourceCommon
  include SystemAccountable
  include Remark

  setup_model('get-pocket',
              'summary',
              @@routes.enterprise_accounting_and_finance_payments_path,
              Enterprise::AccountingAndFinance::PaymentsController)

  belongs_to :exchange_medium

  def summary
    exchange_medium = ExchangeMedium.find_by_id(exchange_medium_id).represent
    system_account_name = SystemAccount.find_by_id(system_account_id).name
    exchange_medium + ' for ' + system_account_name
  end

end
