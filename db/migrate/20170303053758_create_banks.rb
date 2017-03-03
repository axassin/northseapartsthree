class CreateBanks < MainMigration
  def change
    create_table :banks, id: false do |t|
      common_set(t)
      foreign_key_id(t, 'system_account')
      name_column(t)
      remark_column(t)
    end
  end
end
