class CreateStorageUnits < MainMigration
  def change
    create_table :storage_units, id: false do |t|
     common_set(t)
      t.string :remark
      t.string :code
      t.string :parent_storage
      t.timestamps
    end
      add_column :storage_units, :ancestry, :string
      add_index :storage_units, :ancestry
  end
end
