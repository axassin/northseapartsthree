class CreateRegularWorkPeriods < MainMigration
  def change
    create_table :regular_work_periods, id: false do |t|
      common_set(t)
      foreign_key_id(t, 'employee')
      remark_column(t)
      t.date :date_of_implementation, :required => true
      t.time :time_in, :required => true
      t.time :time_out, :required => true
      t.timestamps
    end
  end
end
