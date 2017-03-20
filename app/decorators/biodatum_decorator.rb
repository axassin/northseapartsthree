class BiodatumDecorator < ApplicationDecorator
  delegate_all

  def date_of_birth
    object.created_at.strftime("%m/%d/%Y")
  end

end