class CreateLinks < MainMigration
  def change
    create_table :links, id: false  do |t|
      id_column(t)
      t.string :type, :limit => 64
      t.string :link, :limit => 256
      foreign_key_id(t, 'contact_detail')
      t.timestamps
    end
  end
end
