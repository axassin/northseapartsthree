class CreateSamples < ActiveRecord::Migration[5.0]
  def change
    create_table :samples, id: false do |t|
      common_set(t)
      t.timestamps
    end
  end
end
