module ContactArticulation
  extend ActiveSupport::Concern

  included do

    def label
      ContactDetail.find_by_id(contact_detail_id).label
    end

    def owner
      contact_detail = ContactDetail.find_by_id(contact_detail_id)
      contact_type = contact_detail.contactable_type.constantize
      contact_id = contact_detail.contactable_id.to_s
      contact_type.find_by_id(contact_id)
    end

    searchable do
      text :label
      string :label

      text :owner
      string :owner
    end

  end

end