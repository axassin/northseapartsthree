class CreateTelephoneNumbers < ActiveRecord::Migration[5.0]
  include CommonColumns
  def change
    create_table :telephone_numbers, id: false do |t|
      common_set(t)
      t.string :digits, :limit => 64, :required => true
      foreign_key_id(t, 'contact_detail')
      remark_column(t)
    end
  end
end
