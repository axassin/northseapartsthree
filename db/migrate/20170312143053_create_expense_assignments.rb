class CreateExpenseAssignments < MainMigration
  def change
    create_table :expense_assignments, id: false do |t|
      common_set(t)
      foreign_key_id(t, 'expense_entry')
      t.string :expensable_id, :limit => 36
      t.string  :expensable_type
      remark_column(t)
      t.timestamps
    end
    add_index :expense_assignments, [:expensable_type, :expensable_id]
  end
end
