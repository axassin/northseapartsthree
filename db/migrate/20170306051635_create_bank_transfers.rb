class CreateBankTransfers < MainMigration
  def change
    create_table :bank_transfers, id: false do |t|
      common_set(t)
      t.string  :reference_number, :limit => 36
      t.string  :to_bank_account_number_id, :limit => 36
      t.string  :from_bank_account_number_id, :limit => 36
      t.timestamps
    end
  end
end
