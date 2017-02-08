class CreateRegularWorkPeriods < ActiveRecord::Migration[5.0]
  def change
    create_table :regular_work_periods do |t|

      t.timestamps
    end
  end
end
