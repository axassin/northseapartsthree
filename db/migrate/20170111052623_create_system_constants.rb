class CreateSystemConstants < ActiveRecord::Migration
  include CommonColumns
  def change
    create_table :system_constants, id: false do |t|
      common_set(t)
      label_column(t)
      t.string :category_type, :limit => 256, :required => true
      t.string :value, :limit => 256, :required => true
      implemented_on(t)
    end
  end
end
