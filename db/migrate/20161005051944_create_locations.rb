class CreateLocations < MainMigration
  def change
    create_table :locations, id: false do |t|
      id_column(t)
      t.string :longitude, :limit => 256, :required => true
      t.string :latitude, :limit => 256, :required => true
      t.string :address, :limit => 512, :required => true
      foreign_key_id(t, 'contact_detail')
      t.timestamps
    end
  end
end
