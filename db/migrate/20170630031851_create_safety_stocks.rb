class CreateSafetyStocks < ActiveRecord::Migration[5.0]
  include CommonColumns
  def change
    create_table :safety_stocks, id: false do |t|
      common_set(t)
      foreign_key_id(t, 'greco_item')
      t.integer :amount
      t.timestamps
    end
  end
end
