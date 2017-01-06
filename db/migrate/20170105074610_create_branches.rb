class CreateBranches < MainMigration
  def change
    create_table :branches, id: false do |t|
      common_set(t)
      name_column(t)
      description_column(t)
      foreign_key_id(t, 'system_account')
      t.timestamps
    end
  end
end
