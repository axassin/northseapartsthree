class WizardController < ApplicationController
  include Wicked::Wizard

  layout 'wizard'

  before_action :setup_wizard

  def setup_wizard
    @wizard_steps = wizard_steps
    @current_step = step
  end

  def redirect_setup_update

  end

end
