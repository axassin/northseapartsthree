class CreateAssociatedFiles < ActiveRecord::Migration
  include CommonColumns
  def change
    create_table :associated_files, id: false do |t|
      common_set(t)
      description_column(t)
      name_column(t)
      t.string :file, :limit => 512
      t.string :fileable_id, :limit => 36
      t.string :fileable_type
    end
  end
end
