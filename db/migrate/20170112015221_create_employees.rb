class CreateEmployees < MainMigration
  def change
    create_table :employees, id: false do |t|
      common_set(t)
      foreign_key_id(t, 'system_account')
    end
  end
end
