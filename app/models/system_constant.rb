class SystemConstant < ApplicationRecord

  include GenericResourceCommon

  setup_model('fa-circle-o-notch',
              'label',
              @@routes.enterprise_system_constants_path,
              Enterprise::SystemConstantsController)

  validates :category_type, presence: true, length: { in: 2..256 }
  validates :value, presence: true

  searchable_string(:category_type)
  searchable_string(:label)

end
