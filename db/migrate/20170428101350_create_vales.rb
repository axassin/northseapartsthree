class CreateVales < ActiveRecord::Migration[5.0]
  include CommonColumns
  def change
    create_table 'vales', id: false do |t|
      common_set(t)
      remark_column(t)
      t.monetize :amount
      implemented_on(t)
      foreign_key_id(t, 'employee')
    end
  end
end
