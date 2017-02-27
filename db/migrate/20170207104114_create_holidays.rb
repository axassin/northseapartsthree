class CreateHolidays < MainMigration
  def change
    create_table :holidays, id: false do |t|
      common_set(t)
      remark_column(t)
      implemented_at(t)
      name_column(t)
      t.string :day_scheme_id, :limit => 128
      t.timestamps
    end
  end
end
