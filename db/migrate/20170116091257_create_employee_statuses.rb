class CreateEmployeeStatuses < MainMigration
  def change
    create_table :employee_statuses, id: false do |t|
      common_set(t)
      foreign_key_id(t, 'employee')
      implemented_on(t)
      remark_column(t)
      t.string :state, :limit => 64, :required => true
    end
  end
end
