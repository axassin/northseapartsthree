class Enterprise::SystemAccountController < EnterpriseController

  include GenericResource

  def setup_controller
    setup_variables( Enterprise::SystemAccountController,
                     'fa fa-user ',
                     'System Accounts',
                     'User Entities',
                     nil,
                     nil,
                     @@routes.enterprise_general_management_path,
                     @@routes.enterprise_general_management_system_account_path )
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

end
