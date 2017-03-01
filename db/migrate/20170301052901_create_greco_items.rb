class CreateGrecoItems < MainMigration
  def change
    create_table :greco_items, id: false do |t|
      common_set(t)
      name_column(t)
      description_column(t)
    end
  end
end
