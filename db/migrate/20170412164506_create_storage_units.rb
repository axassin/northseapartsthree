class CreateStorageUnits < ActiveRecord::Migration
  include CommonColumns
  def change
    create_table :storage_units, id: false do |t|
     common_set(t)
     remark_column(t)
     t.string :code
    end
      add_column :storage_units, :ancestry, :string
      add_index :storage_units, :ancestry
  end
end
