class CreateContactDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :contact_details do |t|
      t.string :system_account_id
      t.timestamps
    end
  end
end
