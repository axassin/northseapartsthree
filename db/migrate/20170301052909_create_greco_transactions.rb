class CreateGrecoTransactions < ActiveRecord::Migration[5.0]
  include CommonColumns
  def change
    create_table :greco_transactions, id: false do |t|
      common_set(t)
      foreign_key_id(t, 'greco_item')
      t.integer :quantity
      t.string :transaction_code, :limit => 64
      t.string :transaction_type, :limit => 64
      implemented_on(t)
      remark_column(t)
    end
  end
end
