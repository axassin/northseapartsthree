class Enterprise::Operations::DatabaseSchemaTranslatorController < GenericDashboardController

  def setup_controller
    setup_variables( @@routes.enterprise_operations_database_schema_translator_path,
                     @@routes.enterprise_operations_path)
  end

  def index

  end

  def process_old_files

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
      contact_detail.contactable_id = system_account.id
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
