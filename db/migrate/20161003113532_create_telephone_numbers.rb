class CreateTelephoneNumbers < ActiveRecord::Migration[5.0]
  def change
    create_table :telephone_numbers do |t|

      t.timestamps
    end
  end
end
