module Name
  extend ActiveSupport::Concern

  included do
    validates :name, presence: true, length: { in: 2..128 }

    searchable do
      string :name
      text :name
    end

  end

end