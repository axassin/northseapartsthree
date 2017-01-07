class Enterprise::BranchesController < GenericResourceController

  def setup_controller
    setup_variables( Branch,
                     'Branch',
                     'Establishment Nodes',
                     nil,
                     nil,
                     @@routes.enterprise_path)
  end

  def process_form(my_branch, current_params, wizard_mode = nil)

    branch_processing = Proc.new do
      my_branch.name = current_params[:name]
      my_branch.description = current_params[:description]
      my_branch.save!
      @saved_id = my_branch.id
    end

    setup_process(branch_processing, wizard_mode)
  end

end
