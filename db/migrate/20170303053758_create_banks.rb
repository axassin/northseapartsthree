class CreateBanks < ActiveRecord::Migration[5.0]
  include CommonColumns
  def change
    create_table :banks, id: false do |t|
      common_set(t)
      foreign_key_id(t, 'system_account')
      remark_column(t)
    end
  end
end
