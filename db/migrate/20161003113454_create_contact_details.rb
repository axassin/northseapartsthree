class CreateContactDetails < MainMigration
  def change
    create_table :contact_details, id: false do |t|
      common_set(t)
      t.string :label, :limit => 64, :required => true
      foreign_key_id(t, 'system_account')
    end
  end
end
