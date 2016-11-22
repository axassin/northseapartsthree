module IndexHelper

  def rest_action?
    action_name == 'new' || action_name == 'edit' || action_name == 'show'
  end

  def rest_existing_model_action?
    action_name == 'edit' || action_name == 'show'
  end

end