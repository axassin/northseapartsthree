class CreateBankAccounts < ActiveRecord::Migration[5.0]
  include CommonColumns
  def change
    create_table :bank_accounts, id: false do |t|
      common_set(t)
      foreign_key_id(t, 'system_account')
      foreign_key_id(t, 'bank')
      t.string :account_number, :limit => 64
      remark_column(t)
    end
  end
end
