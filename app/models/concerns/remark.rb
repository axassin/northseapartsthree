module Remark
  extend ActiveSupport::Concern

  included do
    validates :remark, length: { in: 2..64 }

    searchable do
      string :remark
      text :remark
    end

  end

end