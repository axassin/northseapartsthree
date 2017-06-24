class SystemConstant < ApplicationRecord

  include GenericResourceCommon
  include ImplementedOn

  setup_model('label',
              @@routes.enterprise_general_management_system_constants_path,
              Enterprise::GeneralManagement::SystemConstantsController)

  validates :category_type, presence: true, length: { in: 2..256 }
  validates :value, presence: true

  searchable_string(:category_type)
  searchable_string(:label)

  def self.extract_constant(inquired_date = Date.today, category_type)
    system_constant = SystemConstant.where(['implemented_on <= ? AND category_type = ?', inquired_date, category_type])
    system_constant.order('implemented_on DESC').first.value.to_s if system_constant.present?
  end

end
