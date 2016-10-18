class CreateLinks < MainMigration
  def change
    create_table :links, id: false  do |t|
      id_column(t)
      t.string :service, :limit => 64, :required => true
      t.string :url, :limit => 512, :required => true
      foreign_key_id(t, 'contact_detail')
      t.timestamps
      remark_column(t)
    end
  end
end
