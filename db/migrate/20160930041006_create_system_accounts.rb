class CreateSystemAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :system_accounts do |t|

      t.timestamps
    end
  end
end
