class CreateDigitalContactDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :digital_contact_details do |t|

      t.timestamps
    end
  end
end
