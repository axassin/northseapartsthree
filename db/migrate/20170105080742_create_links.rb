class CreateLinks < MainMigration

  def change
    create_table :links, id: false  do |t|
      common_set(t)
      t.string :service, :limit => 64, :required => true
      t.string :url, :limit => 512, :required => true
      foreign_key_id(t, 'contact_detail')
      remark_column(t)
    end
  end

end
