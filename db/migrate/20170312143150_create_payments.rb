class CreatePayments < ActiveRecord::Migration[5.0]
  include CommonColumns
  def change
    create_table :payments, id: false do |t|
      common_set(t)
      foreign_key_id(t, 'system_account')
      foreign_key_id(t, 'exchange_medium')
      remark_column(t)
      t.timestamps
    end
  end
end
