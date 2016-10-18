class CreateTelephoneNumbers < MainMigration
  def change
    create_table :telephone_numbers, id: false do |t|
      id_column(t)
      t.string :digits, :limit => 64, :required => true
      foreign_key_id(t, 'contact_detail')
      t.timestamps
      remark_column(t)
    end
  end
end
