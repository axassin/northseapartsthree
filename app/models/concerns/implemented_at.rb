module ImplementedAt extend ActiveSupport::Concern

  included do

    validates :implemented_at, presence: true
    validates_date :implemented_at

    searchable do
      time :implemented_at
      string :implemented_at
    end

  end

  def implemented_at
    self[:implemented_at].strftime('%m/%d/%Y %r')
  end

end