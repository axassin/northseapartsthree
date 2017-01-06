class Branch < ApplicationRecord

  include GenericResourceCommon
  setup_model('fa-pagelines', 'name')

  has_many :contact_details, as: :contactable

end
