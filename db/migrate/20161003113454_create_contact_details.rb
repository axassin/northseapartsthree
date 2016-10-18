class CreateContactDetails < MainMigration
  def change
    create_table :contact_details, id: false do |t|
      id_column(t)
      t.string :label, :limit => 64, :required => true
      foreign_key_id(t, 'system_account')
      t.timestamps
    end
  end
end
