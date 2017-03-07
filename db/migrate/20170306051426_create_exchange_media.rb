class CreateExchangeMedia < MainMigration
  def change
    create_table :exchange_media, id: false do |t|
      common_set(t)
      t.string :amount, :limit => 64, :required => true
      remark_column(t)
      implemented_at(t)
      t.string :transaction_id, :limit => 36
      t.string  :transaction_type
      t.string :exchange_medium_id, :limit => 36
      t.string  :exchange_medium_type
      t.timestamps
    end
  end
end
