class CreateVendors < ActiveRecord::Migration
  include CommonColumns
  def change
    create_table :vendors, id: false do |t|
      common_set(t)
      foreign_key_id(t, 'system_account')
      t.timestamps
    end
  end
end
