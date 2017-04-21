class CreateRegularWorkPeriods < ActiveRecord::Migration
  include CommonColumns
  def change
    create_table :regular_work_periods, id: false do |t|
      common_set(t)
      foreign_key_id(t, 'employee')
      remark_column(t)
      implemented_on(t)
      t.boolean :one_hour_break, :required => true, :default => true
      t.time :time_in, :required => true, :default => '08:00'
      t.time :time_out, :required => true, :default => '17:00'
      t.timestamps
    end
  end
end
