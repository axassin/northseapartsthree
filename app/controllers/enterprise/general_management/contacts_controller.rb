class Enterprise::GeneralManagement::ContactsController < ApplicationController

  def index
    @system_accounts = SystemAccount.select { |account| account.has_contact_detail? }
  end

end
