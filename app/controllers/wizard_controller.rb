class WizardController < ApplicationController
  include Wicked::Wizard

  layout 'wizard'

  before_action :setup_wizard

  def setup_wizard
    @wizard_steps = wizard_steps
    @current_step = step
    puts previous_step
  end

  def setup_step(class_model)
    @form = class_model.to_s.gsub()
    puts @form
  end

end
