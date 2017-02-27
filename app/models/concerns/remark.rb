module Remark
  extend ActiveSupport::Concern

  included do
    validates :remark, length: { in: 2..64 }, :allow_blank => true

    searchable do
      string :remark
      text :remark
    end

  end

end