class CreateBiodata < MainMigration
  def change
    create_table :biodata, id: false do |t|
      common_set(t)
      foreign_key_id(t, 'employee')
      t.string :name_of_mother, :limit => 256, :required => true
      t.string :name_of_father, :limit => 256, :required => true
      t.string :dependents, :limit => 256, :required => true
      t.string :complexion, :limit => 64, :required => true
      t.string :height, :limit => 64, :required => true
      t.string :sex, :limit => 64, :required => true
      t.string :blood_type, :limit => 64, :required => true
      t.date :date_of_birth, :required => true, :index => true
      t.string :education, :limit => 256, :required => true
      t.string :experience, :limit => 256, :required => true
      t.string :notable_accomplishment, :limit => 256, :required => true
      description_column(t)
    end
  end
end
