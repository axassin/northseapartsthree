class CreateHolidayTypes < MainMigration
  def change
    create_table :holiday_types, id: false do |t|
      common_set(t)
      remark_column(t)
      t.string :name, :limit => 128
      t.float :base_multiplier
      t.float :rest_day_multiplier
      t.timestamps
    end
  end
end
