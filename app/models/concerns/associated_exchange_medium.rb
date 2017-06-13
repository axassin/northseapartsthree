module AssociatedExchangeMedium extend ActiveSupport::Concern

  included do

    belongs_to :exchange_medium
    validates :exchange_medium, presence: true

    searchable do
      text :exchange_summary
      string :exchange_summary
    end

    def exchange_summary
      if ExchangeMedium.find_by_id(exchange_medium_id).present?
        ExchangeMedium.find_by_id(exchange_medium_id).represent
      end
    end

  end


end