class CreateVehicles < ActiveRecord::Migration[5.0]
  include CommonColumns
  def change
    create_table :vehicles, id: false do |t|
      common_set(t)
      t.string :color, :limit => 64, :required => true
      t.string :make, :limit => 64, :required => true
      t.string :brand, :limit => 64, :required => true
      t.string :plate_number, :limit => 64, :required => true
      t.string :fuel_type, :limit => 64, :required => true
      description_column(t)
      t.date :date_of_registration, :required => true
      t.string :primary_image, :limit => 512
    end

  end
end
