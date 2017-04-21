class CreateExchangeMedia < ActiveRecord::Migration
  include CommonColumns
  def change
    create_table :exchange_media, id: false do |t|
      common_set(t)
      t.monetize :amount
      remark_column(t)
      implemented_at(t)
      t.references :transaction, polymorphic: true, index: true
      t.timestamps
    end
  end
end
