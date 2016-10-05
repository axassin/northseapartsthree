class CreateTelephoneNumbers < MainMigration
  def change
    create_table :telephone_numbers, id: false do |t|
      id_column(t)
      t.string :digits, :limit => 256
      system_account_id(t)
      t.timestamps
    end
  end
end
