class AccessPermission < ApplicationRecord

  include GenericResourceCommon
  setup_model('label',
              @@routes.enterprise_system_administration_permissions_access_permissions_path,
              Enterprise::SystemAdministration::Permissions::AccessPermissionsController )

  def label
    # '<user> is allowed to <access> <controller or action>'
  end

end
