class Enterprise::SystemAccountsController < GenericResourceController

  def setup_controller
    setup_variables( SystemAccount,
                     'System Accounts',
                     'User Entities',
                     ['primary_image'],
                     nil,
                     @@routes.enterprise_path)
  end

  def process_form(my_system_account, current_params, wizard_mode = nil)

    system_account_processing = Proc.new do
      my_system_account.name = current_params[:name]
      my_system_account.description = current_params[:description]
      my_system_account.account_type = current_params[:account_type]
      update_primary_image(my_system_account, current_params, wizard_mode)
      my_system_account.save!
    end

    setup_process(my_system_account, system_account_processing, wizard_mode)
  end

  def get_image
    picture_url = Enterprise::SystemAccount.find_by_id(params[:id]).primary_image.url
    render text: picture_url.to_s
  end

end
