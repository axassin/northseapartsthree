class Enterprise::SystemAccountsController < EnterpriseController

  include GenericResource

  def setup_controller
    setup_variables( Enterprise::SystemAccount,
                     'fa fa-user ',
                     'System Accounts',
                     'User Entities',
                     ['primary_image'],
                     nil,
                     @@routes.enterprise_path,
                     @@routes.enterprise_system_accounts_path )
  end

  def process_form(my_system_account, current_params)

    system_account_processing = Proc.new do
      my_system_account.name = current_params[:name]
      my_system_account.description = current_params[:description]
      my_system_account.account_type = current_params[:account_type]
      update_primary_image(my_system_account, current_params)
      my_system_account.save!
    end

    setup_process(system_account_processing)
  end

  def get_image
    picture_url = Enterprise::SystemAccount.find_by_id(params[:id]).primary_image.url
    render text: picture_url.to_s
  end

end
