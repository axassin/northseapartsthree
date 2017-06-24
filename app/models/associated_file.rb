class AssociatedFile < ApplicationRecord

  include GenericResourceCommon
  include Description

  belongs_to :fileable, polymorphic: true

  setup_model('name',
              @@routes.enterprise_general_management_associated_files_path,
              Enterprise::GeneralManagement::AssociatedFilesController)

  mount_uploader :file, AssociatedFileUploader

  validates :file, file_size: { less_than_or_equal_to: 1.gigabytes }

  def fileable_name
    fileable_type.constantize.find(fileable_id).represent
  end

  def fileable
    fileable_type.constantize.find(fileable_id)
  end

  def file_identifier
    self.file.identifier
  end

  searchable_string(:description)
  searchable_string(:name)
  searchable_string(:fileable_name)
  searchable_string(:file_identifier)

end
