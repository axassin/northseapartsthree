class CreateBankAccounts < MainMigration
  def change
    create_table :bank_accounts, id: false do |t|
      common_set(t)
      foreign_key_id(t, 'system_account')
      t.string :account_number, :limit => 64
    end
  end
end
