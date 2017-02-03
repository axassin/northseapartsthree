class Enterprise::GeneralManagement::BranchesController < GenericResourceController

  def setup_controller
    setup_variables( Branch,
                     'Branch',
                     'Establishment Nodes',
                     [],
                     [],
                     @@routes.enterprise_general_management_path)
  end

  def process_form(my_branch, current_params, wizard_mode = nil)

    branch_processing = Proc.new do
      my_branch.name = current_params[:name]
      my_branch.description = current_params[:description]
      my_branch.save!
    end

    setup_process(my_branch, branch_processing, wizard_mode)
  end

end
