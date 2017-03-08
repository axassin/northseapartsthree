class CreateCashes < MainMigration
  def change
    create_table :cashes, id: false do |t|
      common_set(t)
      t.string :denomination
      t.string :reference_number
      foreign_key_id(t, 'exchange_medium')
      t.timestamps
    end
  end
end
