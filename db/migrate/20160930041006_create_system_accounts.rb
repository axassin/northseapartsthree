class CreateSystemAccounts < MainMigration
  def change
    create_table :system_accounts, id: false do |t|
      id_column(t)
      name_column(t)
      description_column(t)
      t.string :account_type, :limit => 64, :required => true
      t.string :primary_image, :limit => 512
      t.timestamps
    end
  end
end