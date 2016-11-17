RSpec.shared_examples 'generic_resource_controller' do |class_model_symbol|

  describe 'GET index' do

    model_array = []

    it 'response success' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders template' do
      get :index
      expect(response).to render_template('layouts/generic_resource/main')
    end

    it 'loads initial data' do
      model_array.clear
      10.times { model_array.push(FactoryGirl.create class_model_symbol.to_sym) }
      get :index
      expect(assigns(:result_set)).to match_array(model_array)
    end

    it 'loads data according to user options' do

      model_array.clear

      number_of_models = rand(1..100)
      number_of_models.times { model_array.push(FactoryGirl.create class_model_symbol.to_sym) }

      per_page = rand(1..100)
      max_page = (number_of_models/per_page.to_f).ceil

      puts 'number_of_models: ' +  number_of_models.to_s
      puts 'per_page: ' +  per_page.to_s
      puts 'max_page: ' +  max_page.to_s


      # get :index, {:id => '1')
    end

    it 'orders data' do
=begin
      model_array.clear
=end
    end

    it 'paginates data' do
=begin
      model_array.clear
      per_page = [1..100].sample
      page = [1..20].sample
      100.times { model_array.push(FactoryGirl.create class_model_symbol.to_sym) }

      get :index, { :per_page => per_page, :page => page }
      expect(assigns(:result_set).total).should eq(per_page)
=end
    end

    it 'combination test' do

    end

  end

  describe 'GET new' do

  end

  describe 'POST create' do

  end

  describe 'GET show' do

  end

  describe 'GET show' do

  end

  describe 'GET edit' do

  end

  describe 'PATCH update' do

  end

  describe 'DELETE destroy' do

  end

  describe 'Search Suggestions' do

  end


end