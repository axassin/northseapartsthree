class CreateExchangeMedia < MainMigration
  def change
    create_table :exchange_media, id: false do |t|
      common_set(t)
      t.string :amount, :limit => 64, :required => true
      t.string :currency, :limit => 64, :required => true
      remark_column(t)
      implemented_at(t)
      t.references :transaction, polymorphic: true, index: true
      t.timestamps
    end
  end
end
