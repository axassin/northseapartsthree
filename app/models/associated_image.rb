class AssociatedImage < ApplicationRecord

  include GenericResourceCommon
  include Description

  belongs_to :imageable, polymorphic: true

  setup_model('fa-image',
              'name',
              @@routes.enterprise_general_management_associated_images_path,
              Enterprise::GeneralManagement::AssociatedImagesController)

  validates :image, file_size: { less_than_or_equal_to: 10.megabytes }

  mount_uploader :image, AssociatedImageUploader

  def related
    imageable_type.constantize.find(imageable_id).represent
  end

  def file_link
    self.image.identifier
  end

  searchable_string(:description)
  searchable_string(:name)
  searchable_string(:related)
  searchable_string(:file_link)

end
