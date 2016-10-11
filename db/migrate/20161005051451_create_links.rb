class CreateLinks < MainMigration
  def change
    create_table :links, id: false  do |t|
      id_column(t)
      t.string :service, :limit => 64
      t.string :url, :limit => 512
      foreign_key_id(t, 'contact_detail')
      t.timestamps
    end
  end
end
