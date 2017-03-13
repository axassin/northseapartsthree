class CreateExpenseAssignments < MainMigration
  def change
    create_table :expense_assignments, id: false do |t|
      common_set(t)
      foreign_key_id(t, 'expense_entry')
      foreign_key_id(t, 'system_account')
      t.timestamps
    end
  end
end
