class CreateExchangeMedia < ActiveRecord::Migration[5.0]
  include CommonColumns
  def change
    create_table :exchange_media, id: false do |t|
      common_set(t)
      t.monetize :amount
      remark_column(t)
    end
  end
end
