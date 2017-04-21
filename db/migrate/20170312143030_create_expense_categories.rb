class CreateExpenseCategories < MainMigration
  def change
    create_table :expense_categories, id: false do |t|
      common_set(t)
      name_column(t)
      remark_column(t)
    end
    add_column :expense_categories, :ancestry, :string
    add_index :expense_categories, :ancestry
  end
end
