class CreateAttendanceRecords < MainMigration
  def change
    create_table :attendance_records, id: false do |t|
      common_set(t)
      foreign_key_id(t, 'employee')
      remark_column(t)
      t.date :current_date, :required => true
      t.time :time_in, :required => true
      t.time :time_out, :required => true
    end
  end
end
