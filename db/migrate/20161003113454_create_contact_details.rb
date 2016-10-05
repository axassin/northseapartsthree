class CreateContactDetails < MainMigration
  def change
    create_table :contact_details, id: false do |t|
      id_column(t)
      label_column(t)
      description_column(t)
      t.timestamps
    end
  end
end
