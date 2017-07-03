class Payment < ApplicationRecord

  include GenericResourceCommon
  include AssociatedEmployee
  include AssociatedExchangeMedium
  include Remark

  setup_model('summary',
              @@routes.enterprise_accounting_and_finance_payments_report_payments_path,
              Enterprise::AccountingAndFinance::PaymentsReport::PaymentsController)

  belongs_to :exchange_medium
  belongs_to :system_account

  validates_uniqueness_of :exchange_medium
  validates_presence_of :system_account

  def summary
    exchange_medium = ExchangeMedium.find_by_id(exchange_medium_id).represent
    system_account_name = SystemAccount.find_by_id(system_account_id).name
    exchange_medium + ' for ' + system_account_name
  end

  def self.payables(start_date, end_date, system_account_id)
    Payment.where('disbursement_date >= ? AND disbursement_date < ? AND system_account_id = ?',start_date, end_date, system_account_id)
  end

  def self.total(start_date, end_date, system_account_id)
    total = 0
    Payment.where('disbursement_date >= ? AND disbursement_date < ? AND system_account_id = ?',start_date, end_date, system_account_id).each do |element|
      total += element.exchange_medium.amount_php
    end
    total.round(2)
  end

  def self.balance(current_date,system_account_id)
    total = 0
    Payment.where('disbursement_date < ? AND system_account_id = ?',current_date, system_account_id).each do |element|
      total += element.exchange_medium.amount_php
    end
    total.round(2)
  end

end
