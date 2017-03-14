class CreateAssociatedImages < MainMigration
  def change
    create_table :associated_images, id: false do |t|
      common_set(t)
      description_column(t)
      name_column(t)
      t.string :image, :limit => 512
      t.string :imageable_id, :limit => 36
      t.string :imageable_type
    end
  end
end
