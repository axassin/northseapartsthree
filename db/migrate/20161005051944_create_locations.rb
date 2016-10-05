class CreateLocations < MainMigration
  def change
    create_table :locations, id: false do |t|
      id_column(t)
      t.string :longitude, :limit => 256
      t.string :latitude, :limit => 256
      t.string :address, :limit => 256
      system_account_id(t)
      t.timestamps
    end
  end
end
