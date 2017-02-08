class CreateDaySchemes < MainMigration
  def change
    create_table :day_schemes, id: false do |t|
      common_set(t)
      t.string :type_name, :limit => 128
      t.float :base_multiplier
      t.float :overtime_multiplier
      t.float :rest_day_multiplier
      t.float :overtime_rest_day_multiplier
      implemented_at(t)
      remark_column(t)
    end
  end
end