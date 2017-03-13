class CreateExpenseEntries < MainMigration
  def change
    create_table :expense_entries, id: false do |t|
      common_set(t)
      foreign_key_id(t, 'vendor')
      foreign_key_id(t, 'expense_category')
      t.date :due_date, :required => true
      t.string :receiving_party_id, :limit => 36
      t.string :reference_number
      t.monetize :amount
      remark_column(t)
      t.timestamps
    end
  end
end
