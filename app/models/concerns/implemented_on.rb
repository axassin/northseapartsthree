module ImplementedOn extend ActiveSupport::Concern

  included do

    validates :implemented_on, presence: true
    validates_date :implemented_on

    searchable do
      time :implemented_on
      string :implemented_on
    end

  end

end