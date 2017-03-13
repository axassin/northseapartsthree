class CreateExpenseCategories < MainMigration
  def change
    create_table :expense_categories, id: false do |t|
      common_set(t)
      foreign_key_id(t, 'parent')
      name_column(t)
      remark_column(t)
      t.timestamps
    end
  end
end
