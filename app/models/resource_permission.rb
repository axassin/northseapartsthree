class ResourcePermission < ApplicationRecord

  include GenericResourceCommon
  setup_model('label',
              @@routes.enterprise_system_administration_permissions_resource_permissions_path,
              Enterprise::SystemAdministration::Permissions::ResourcePermissionsController )

  def label
    # '<user> is allowed to <access> <controller or action>'
  end

end
