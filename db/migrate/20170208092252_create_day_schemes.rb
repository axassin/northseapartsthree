class CreateDaySchemes < ActiveRecord::Migration[5.0]
  include CommonColumns
  def change
    create_table :day_schemes, id: false do |t|
      common_set(t)
      t.string :type_name, :limit => 64
      t.float :base_multiplier
      t.float :overtime_multiplier
      t.float :rest_day_multiplier
      t.float :overtime_rest_day_multiplier
      implemented_on(t)
      remark_column(t)
    end
  end
end