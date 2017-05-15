class CreateContactDetails < ActiveRecord::Migration[5.0]
  include CommonColumns
  def change
    create_table :contact_details, id: false do |t|
      common_set(t)
      t.string :label, :limit => 64, :required => true
      t.string :contactable_id, :limit => 36
      t.string  :contactable_type
    end
    add_index :contact_details, [:contactable_type, :contactable_id]
  end
end