class CreateExchangeMedia < MainMigration
  def change
    create_table :exchange_media, id: false do |t|
      common_set(t)

      t.monetize :amount_cents

      remark_column(t)
      implemented_at(t)
      t.references :transaction, polymorphic: true, index: true
      t.timestamps
    end
  end
end
