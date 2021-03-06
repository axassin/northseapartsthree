class CreateGrecoItems < ActiveRecord::Migration[5.0]
  include CommonColumns
  def change
    create_table :greco_items, id: false do |t|
      common_set(t)
      name_column(t)
      remark_column(t)
    end
  end
end
