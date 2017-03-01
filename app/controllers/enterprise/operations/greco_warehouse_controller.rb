class Enterprise::Operations::GrecoWarehouseController < GenericDashboardController

  def setup_controller
    setup_variables( @@routes.enterprise_operations_greco_warehouse_path,
                     @@routes.enterprise_operations_path)
  end

end
