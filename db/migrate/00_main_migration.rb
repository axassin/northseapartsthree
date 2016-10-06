# Super Class for all Migrations

class MainMigration < ActiveRecord::Migration
  include CommonColumns
end