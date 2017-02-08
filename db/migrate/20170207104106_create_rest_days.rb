class CreateRestDays < MainMigration
  def change
    create_table :rest_days, id: false do |t|

      t.timestamps
    end
  end
end
