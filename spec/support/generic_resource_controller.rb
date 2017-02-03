RSpec.shared_examples 'success_render' do |controller_action|

  it 'response success' do
    get controller_action.to_sym
    expect(response).to be_success
    expect(response).to have_http_status(200)
  end

  it 'renders template' do
    get controller_action.to_sym
    expect(response).to render_template('layouts/generic_resource/main')
  end

end

RSpec.shared_examples 'generic_resource_controller' do |class_model,
                                                        resource_glyphicon,
                                                        resource_title_heading,
                                                        resource_sub_heading,
                                                        main_resource_path,
                                                        omitted_attributes,
                                                        parent_controller_path|

  describe 'GET index' do

    model_array = []
    it_behaves_like 'success_render', 'index'

    it 'loads resource variables' do
      get :index
      omitted_attributes = omitted_attributes.push('deleted_at')
      expect(assigns(:resource_glyphicon)).to eq(resource_glyphicon)
      expect(assigns(:resource_title_heading)).to eq(resource_title_heading)
      expect(assigns(:resource_sub_heading)).to eq(resource_sub_heading)
      expect(assigns(:omitted_attributes)).to eq(omitted_attributes)
      expect(assigns(:parent_controller_path)).to eq(parent_controller_path)
    end

    it 'loads initial result set' do
      model_array.clear
      10.times { model_array.push(FactoryGirl.create class_model.to_sym) }
      get :index
      expect(assigns(:result_set)).to match_array(model_array)
    end

  end

end