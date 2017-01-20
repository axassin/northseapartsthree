class AssociatedFile < ApplicationRecord

  include GenericResourceCommon
  include Description

  belongs_to :fileable, polymorphic: true

  setup_model('fa-file',
              'name',
              @@routes.enterprise_associated_files_path,
              Enterprise::AssociatedFilesController)

  mount_uploader :file, AssociatedFileUploader

end
