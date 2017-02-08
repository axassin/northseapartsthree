module ImplementedAt extend ActiveSupport::Concern

  included do

    validates :implemented_at, presence: true

    searchable do
      time :implemented_at
      string :implemented_at
    end

  end

end