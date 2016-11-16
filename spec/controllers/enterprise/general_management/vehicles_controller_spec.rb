require 'rails_helper'

RSpec.describe Enterprise::GeneralManagement::ContactsController, type: :controller do

  describe 'GET index' do

    it 'response success' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'loads initial data' do
      vehicle_01 = FactoryGirl.create :vehicle
    end

  end

end
