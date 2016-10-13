class Enterprise::GeneralManagement::ContactsController < ApplicationController

  def index

    @system_accounts = SystemAccount.all

  end

end
