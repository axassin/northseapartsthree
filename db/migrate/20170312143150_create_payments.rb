class CreatePayments < ActiveRecord::Migration[5.0]
  include CommonColumns
  def change
    create_table :payments, id: false do |t|
      common_set(t)
      foreign_key_id(t, 'system_account')
      foreign_key_id(t, 'employee')
      foreign_key_id(t, 'exchange_medium')
      t.date :disbursement_date, :required => true
      t.string :payable_id, :limit => 36
      t.string  :payable_type
      remark_column(t)
      t.timestamps
    end
  end
end
