class CreateRestDays < MainMigration
  def change
    create_table :rest_days, id: false do |t|
      common_set(t)
      foreign_key_id(t, 'employee')
      remark_column(t)
      t.date :date_of_implementation, :required => true
      t.string :day, :required => true
      t.timestamps
    end
  end
end
