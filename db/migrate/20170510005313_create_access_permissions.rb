class CreateAccessPermissions < ActiveRecord::Migration[5.0]
  include CommonColumns
  def change
    create_table :access_permissions, id: false do |t|
      common_set(t)
      foreign_key_id(t, 'user')
    end
  end
end
