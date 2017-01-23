class AssociatedFile < ApplicationRecord

  include GenericResourceCommon
  include Description

  belongs_to :fileable, polymorphic: true

  setup_model('fa-file',
              'name',
              @@routes.enterprise_associated_files_path,
              Enterprise::AssociatedFilesController)

  mount_uploader :file, AssociatedFileUploader

  validates :file, file_size: { less_than_or_equal_to: 1.gigabytes }

  def related
    fileable_type.constantize.find(fileable_id).represent
  end

  def file_link
    self.file.identifier
  end

  searchable_string(:description)
  searchable_string(:name)
  searchable_string(:related)
  searchable_string(:file_link)

end
