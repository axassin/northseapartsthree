class CreateLocations < MainMigration
  def change
    create_table :locations, id: false do |t|
      common_set(t)
      t.string :longitude, :limit => 256, :required => true
      t.string :latitude, :limit => 256, :required => true
      t.string :address, :limit => 512, :required => true
      foreign_key_id(t, 'contact_detail')
    end
  end
end
