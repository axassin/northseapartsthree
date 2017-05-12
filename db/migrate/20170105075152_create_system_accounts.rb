class CreateSystemAccounts < ActiveRecord::Migration[5.0]
  include CommonColumns
  def change
    create_table :system_accounts, id: false do |t|
      common_set(t)
      name_column(t)
      description_column(t)
      t.string :account_type, :limit => 64, :required => true
      t.string :primary_image, :limit => 512
    end
  end
end