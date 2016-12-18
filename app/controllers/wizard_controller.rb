class WizardController < ApplicationController
  include Wicked::Wizard

  layout 'wizard'

  before_action :setup_wizard

  def setup_wizard
    @step_count = 'dfasdfafddf dfa'
  end

end
