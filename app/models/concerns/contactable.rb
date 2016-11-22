module Contactable
  extend ActiveSupport::Concern

  included do

    def label
      ContactDetail.find_by_id(contact_detail_id).label
    end

    def label_id
      ContactDetail.find_by_id(contact_detail_id).id
    end

    def owner
      owner_account = ContactDetail.find_by_id(contact_detail_id).system_account
      SystemAccount.find_by_id(owner_account.id).name
    end

    def owner_id
      owner_account = ContactDetail.find_by_id(contact_detail_id).system_account
      SystemAccount.find_by_id(owner_account.id).id
    end

    searchable do
      text :label
      string :label

      text :owner
      string :owner
    end

  end

end