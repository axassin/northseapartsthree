module ContactableResource
  extend ActiveSupport::Concern

  def has_contact_detail?
    ContactDetail.exists?(contactable_id: self.id, contactable_type: self.class.to_s)
  end

  def all_contact_details
    ContactDetail.where(contactable_id: self.id, contactable_type: self.class.to_s)
  end

end