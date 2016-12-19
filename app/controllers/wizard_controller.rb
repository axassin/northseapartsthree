class WizardController < ApplicationController
  include Wicked::Wizard

  layout 'wizard'

  before_action :setup_wizard

  def setup_wizard
    @step_count = wizard_steps
  end

  def redirect_setup_update

  end

end
