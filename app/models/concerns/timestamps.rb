module Timestamps extend ActiveSupport::Concern

  included do

    searchable do
      time :created_at
      time :updated_at
    end

  end

end