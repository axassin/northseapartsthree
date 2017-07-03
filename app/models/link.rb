class Link < ApplicationRecord

  include GenericResourceCommon
  setup_model('url',
              @@routes.enterprise_general_management_contact_details_links_path,
              Enterprise::GeneralManagement::ContactDetails::LinksController)

  include ContactArticulation
  include Remark

  belongs_to :contact_detail
  validates_presence_of :contact_detail

  validates :service, length: { in: 2..64 }, presence: true
  validates :url, length: { in: 2..512 }, presence: true

  searchable_string(:service)
  searchable_string(:url)

end
