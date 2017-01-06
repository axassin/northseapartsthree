class Branch < ApplicationRecord

  include GenericResourceCommon
  setup_model('fa-pagelines')

  has_many :contact_details, as: :contactable

end
