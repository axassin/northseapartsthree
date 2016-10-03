class CreateSystemAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :system_accounts do |t|
      t.string :name, :limit => 64
      t.string :description, :limit => 256
      t.string :type, :limit => 64
      t.string :primary_image, :limit => 512
      t.timestamps
    end
  end
end