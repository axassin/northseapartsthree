class Enterprise::GeneralManagement::ContactDetails::LinksController <  Enterprise::GeneralManagement::ContactDetailsController

  def setup_controller
    setup_variables( Link,
                     'fa fa-external-link',
                     'Link',
                     'Communication Assets',
                     [],
                     [],
                     @@routes.enterprise_general_management_contact_details_path,
                     @@routes.enterprise_general_management_contact_details_links_path )
  end

  def index
    setup_index
  end

  def search_suggestions
    setup_search_suggestions
  end

  def process_form(my_telephone, current_params)

    link_processing = Proc.new do
      my_telephone.service = current_params[:service]
      my_telephone.url = current_params[:url]
      my_telephone.remark = current_params[:remark]
      my_telephone.contact_detail_id = current_params[:contact_detail_id]
      my_telephone.save!
    end

    setup_process(link_processing)
  end

  def new
    setup_form
  end

  def create
    process_form(Link.new, params[:link])
  end

  def show
    setup_form
  end

  def edit
    setup_form
  end

  def update
    process_form(Link.find(params[:id]), params[:link])
  end

  def destroy
    setup_delete
  end

end
