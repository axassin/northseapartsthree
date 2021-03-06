class Development::DatabaseMigrationInitializerController < GenericReportController

  def setup_controller
    setup_variables( @@routes.development_database_migration_initializer_path,
                     @@routes.development_path)

  end

  def index
    @button_set = [
        [development_database_migration_initializer_initialize_greco_inventory_path, 'Greco Inventory Initializer'],
        [development_database_migration_initializer_initialize_northseapartstwo_data_path, 'North Sea Parts Two Initializer']
    ]
  end

  def initialize_greco_inventory

    require 'roo'

    greco_item_sheet = Roo::Spreadsheet.open('migration_sheets/greco_items.csv')
    greco_item_sheet.each_with_index(old_id: 'id', name: 'name', remark: 'remark') do |current_stock_hash, index|
      unless index == 0
        greco_old_id = current_stock_hash[:old_id]
        greco_item = GrecoItem.new()
        greco_item.name = current_stock_hash[:name]
        greco_item.remark = current_stock_hash[:remark]
        greco_item.save!

        greco_transaction_sheet = Roo::Spreadsheet.open('migration_sheets/greco_transactions.csv')
        greco_transaction_sheet.each_with_index(greco_item_id: 'greco_item_id', quantity: 'quantity', transaction_code: 'transaction_code',transaction_type: 'transaction_type', implemented_on: 'implemented_on', remark: 'remark') do |transaction_hash, index|
          unless index == 0
            if transaction_hash[:greco_item_id] == greco_old_id

              greco_transaction = GrecoTransaction.new()
              greco_transaction.greco_item = greco_item
              greco_transaction.quantity = transaction_hash[:quantity].to_i
              greco_transaction.transaction_code = transaction_hash[:transaction_code]
              greco_transaction.transaction_type = transaction_hash[:transaction_type]
              greco_transaction.implemented_on = transaction_hash[:implemented_on].to_s
              greco_transaction.remark = transaction_hash[:remark]
              greco_transaction.save!

            end
          end
        end
      end
    end

    redirect_to action: 'index'
  end

  def initialize_northseapartstwo_data

    require 'roo'

    system_account_sheet = Roo::Spreadsheet.open('migration_sheets/system_account.csv')
    addresses_sheet = Roo::Spreadsheet.open('migration_sheets/addresses.csv')
    telephones_sheet = Roo::Spreadsheet.open('migration_sheets/telephones.csv')

    system_account_sheet.each(id: 'id', name: 'name', remark: 'remark') do |system_account_hash|

      system_account = SystemAccount.new()
      system_account.name = system_account_hash[:name]
      system_account.description = system_account_hash[:remark]
      system_account.account_type = 'GROUP'
      system_account.save!

      basis_id = system_account_hash[:id]
      system_account_id = system_account.id

      contact_detail = ContactDetail.new()
      contact_detail.label = 'main'
      contact_detail.contactable_id = system_account_id
      contact_detail.contactable_type = 'SystemAccount'
      contact_detail.save!

      contact_detail_id = contact_detail.id

      telephones_sheet.each(digits: 'digits', remark: 'remark', telephonable_type: 'telephonable_type', telephonable_id: 'telephonable_id') do |telephones_sheet|
        if telephones_sheet[:telephonable_type] == 'SystemAccount' && telephones_sheet[:telephonable_id] == basis_id
          telephone_number = TelephoneNumber.new
          telephone_number.contact_detail_id = contact_detail_id
          telephone_number.remark = telephones_sheet[:remark]
          telephone_number.digits = telephones_sheet[:digits]
          telephone_number.save
        end
      end

      addresses_sheet.each(remark: 'remark', addressable_type: 'addressable_type', addressable_id: 'addressable_id') do |addresses_sheet|
        if addresses_sheet[:addressable_type] == 'SystemAccount' && addresses_sheet[:addressable_id] == basis_id
          location = Location.new
          location.address = addresses_sheet[:remark]
          location.contact_detail_id = contact_detail_id
          location.longitude = 0.00000000
          location.latitude = 0.00000000
          location.save
        end
      end

      puts 'processing : ' + system_account.name

    end

    redirect_to action: 'index'

  end

end
