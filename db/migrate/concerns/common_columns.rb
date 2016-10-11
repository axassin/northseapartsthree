# Provide helper functions for commonly used columns in migrations

module CommonColumns
  extend ActiveSupport::Concern

  def id_column(t)
    t.string :id, :limit => 36, primary_key: true
  end

  def name_column(t)
    t.string :name, :limit => 64
  end

  def label_column(t)
    t.string :label, :limit => 64
  end

  def description_column(t)
    t.string :description, :limit => 512
  end

  def foreign_key_id(t, foreign_key)
    t.string (foreign_key + '_id').to_sym, :limit => 36
  end

end