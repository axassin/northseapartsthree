class CreateHolidays < MainMigration
  def change
    create_table :holidays, id: false do |t|
      common_set(t)
      remark_column(t)
      t.date :date_of_implementation, :required => true
      t.string :name, :limit => 128
      t.string :type, :limit => 128
      t.timestamps
    end
  end
end
