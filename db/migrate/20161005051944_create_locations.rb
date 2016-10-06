class CreateLocations < MainMigration
  def change
    create_table :locations, id: false do |t|
      id_column(t)
      t.string :longitude, :limit => 256
      t.string :latitude, :limit => 256
      t.string :address, :limit => 512
      foreign_key_id(t, 'contact_detail')
      t.timestamps
    end
  end
end
