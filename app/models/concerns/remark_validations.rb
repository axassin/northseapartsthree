module RemarkValidations extend ActiveSupport::Concern

  included do
    validates :remark, length: { in: 2..64 }
  end

end