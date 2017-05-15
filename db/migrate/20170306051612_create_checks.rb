class CreateChecks < ActiveRecord::Migration
  include CommonColumns
  def change
    create_table :checks, id: false do |t|
      common_set(t)
      foreign_key_id(t, 'bank_account')
      t.string :check_number, :limit => 36
      t.date :dated, :required => true
      t.string :signatory, :limit => 36
      t.string :payee, :limit => 36
      foreign_key_id(t, 'exchange_medium')
      t.timestamps
    end
  end
end
