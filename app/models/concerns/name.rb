module Name
  extend ActiveSupport::Concern

  included do
    validates :name, presence: true, length: { in: 2..64 }

    searchable do
      string :name
      text :name
    end

  end

end