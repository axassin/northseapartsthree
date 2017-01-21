class AssociatedFile < ApplicationRecord

  include GenericResourceCommon
  include Description

  belongs_to :fileable, polymorphic: true

  setup_model('fa-file',
              'name',
              @@routes.enterprise_associated_files_path,
              Enterprise::AssociatedFilesController)

  mount_uploader :file, AssociatedFileUploader

  def file_link

  end

  searchable_string(:description)
  searchable_string(:name)
  searchable_string(:related)

end
