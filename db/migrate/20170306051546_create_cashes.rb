class CreateCashes < MainMigration
  def change
    create_table :cashes, id: false do |t|
      common_set(t)
      t.string :denomination
      t.string :reference_number
      t.timestamps
    end
  end
end
