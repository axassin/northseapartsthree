class CreateEmployees < ActiveRecord::Migration
  include CommonColumns
  def change
    create_table :employees, id: false do |t|
      common_set(t)
      foreign_key_id(t, 'system_account')
      foreign_key_id(t, 'branch')
      t.string :position, :limit => 64
    end
  end
end
