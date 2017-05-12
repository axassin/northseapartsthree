class CreateBranches < ActiveRecord::Migration[5.0]
  include CommonColumns
  def change
    create_table :branches, id: false do |t|
      common_set(t)
      name_column(t)
      description_column(t)
    end
  end
end
