class CreateExpenseAuthorizations < ActiveRecord::Migration[5.0]
  include CommonColumns
  def change
    create_table :expense_authorizations, id: false do |t|
      common_set(t)
      foreign_key_id(t, 'expense_entry')
      foreign_key_id(t, 'employee')
      t.string :status, :limit => 64, :required => true
      implemented_on(t)
      remark_column(t)
    end
  end
end
