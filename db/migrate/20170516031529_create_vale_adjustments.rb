class CreateValeAdjustments < ActiveRecord::Migration[5.0]
  include CommonColumns
  def change
    create_table 'vale_adjustments', id: false do |t|
      common_set(t)
      foreign_key_id(t, 'employee')
      remark_column(t)
      t.string :transaction_type
      t.monetize :amount    
      implemented_on(t)
    end
  end
end
