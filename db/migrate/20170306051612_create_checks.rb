class CreateChecks < MainMigration
  def change
    create_table :checks, id: false do |t|
      common_set(t)
      foreign_key_id(t, 'bank_account')
      t.string  :check_number, :limit => 36
      t.date :dated, :required => true
      foreign_key_id(t, 'system_account')
      t.timestamps
    end
  end
end
