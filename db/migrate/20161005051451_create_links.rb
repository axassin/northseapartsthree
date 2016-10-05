class CreateLinks < MainMigration
  def change
    create_table :links, id: false  do |t|
      id_column(t)
      t.string :type, :limit => 64
      t.string :link, :limit => 256
      system_account_id(t)
      t.timestamps
    end
  end
end
