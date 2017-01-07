class Branch < ApplicationRecord

  include GenericResourceCommon
  setup_model('fa-pagelines', 'name', @@routes.enterprise_branches_path, Enterprise::BranchesController)

  has_many :contact_details, as: :contactable

end
