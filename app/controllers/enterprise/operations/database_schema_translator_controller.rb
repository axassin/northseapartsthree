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
      system_account.account_type = 'INDIVIDUAL'
      system_account.save!

      basis_id = system_account_hash[:id]
      system_account_id = system_account.id

=begin
      telephones_sheet.each(digits: 'digits', remark: 'remark', telephonable_type: 'telephonable_type', telephonable_id: 'telephonable_id') do |telephones_sheet|
        if telephones_sheet[:telephonable_type] == 'SystemAccount' && telephones_sheet[:telephonable_id] == basis_id
          puts telephones_sheet[:digits]
          puts telephones_sheet[:remark]
        end
      end

      addresses_sheet.each(remark: 'remark', addressable_type: 'addressable_type', addressable_id: 'addressable_id') do |addresses_sheet|
        if addresses_sheet[:addressable_type] == 'SystemAccount' && addresses_sheet[:addressable_id] == basis_id
          puts telephones_sheet[:digits]
          puts telephones_sheet[:remark]
        end
      end
=end

    end

    redirect_to action: 'index'
  end

end
