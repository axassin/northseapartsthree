class CreateVehicles < MainMigration
  def change
    create_table :vehicles, id: false do |t|
      id_column(t)
      t.string :color, :limit => 64, :required => true
      t.string :make, :limit => 64, :required => true
      t.string :brand, :limit => 64, :required => true
      t.string :plate_number, :limit => 64, :required => true
      description_column(t)
      t.date :date_of_registration, :required => true
      t.string :primary_image, :limit => 512
      t.timestamps
    end
  end
end
