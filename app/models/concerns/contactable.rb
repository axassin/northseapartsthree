module Contactable
  extend ActiveSupport::Concern

  included do

    def label
      Enterprise::GeneralManagement::ContactDetail.find_by_id(contact_detail_id).label
    end

    def label_id
      Enterprise::GeneralManagement::ContactDetail.find_by_id(contact_detail_id).id
    end

    def owner
      owner_account = Enterprise::GeneralManagement::ContactDetail.find_by_id(contact_detail_id).system_account
      Enterprise::SystemAccount.find_by_id(owner_account.id).name
    end

    def owner_id
      owner_account = Enterprise::GeneralManagement::ContactDetail.find_by_id(contact_detail_id).system_account
      Enterprise::SystemAccount.find_by_id(owner_account.id).id
    end

    searchable do
      text :label
      string :label

      text :owner
      string :owner
    end

  end

end