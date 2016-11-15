module Description
  extend ActiveSupport::Concern

  included do
    validates :description, length: { in: 2..512 }, :allow_blank => true

    searchable do
      text :description
      string :description
    end

  end

end