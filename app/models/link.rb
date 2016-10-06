class Link < ApplicationRecord

  belongs_to :contact_detail

  validates :digits

end
