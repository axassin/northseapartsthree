class Branch < ApplicationRecord

  include GenericResourceCommon
  include ContactableResource

  setup_model('fa-pagelines',
              'name',
              @@routes.enterprise_branches_path,
              Enterprise::BranchesController)

  has_many :contact_details, as: :contactable
  has_many :employees

end
