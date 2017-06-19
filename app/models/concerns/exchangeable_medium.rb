module ExchangeableMedium
  extend ActiveSupport::Concern

  included do

    belongs_to :exchange_medium
    validates_presence_of :exchange_medium

    searchable do
      text :exchange_medium
      string :exchange_medium
    end

    def amount
      exchange_medium = ExchangeMedium.find_by_id(exchange_medium_id)
      exchange_medium.amount.to_s + ' ' + exchange_medium.amount_currency.to_s
    end

  end

end