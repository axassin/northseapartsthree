# Provide helper functions for commonly used columns in migrations

module CommonColumns
  extend ActiveSupport::Concern

  def id_column(t)
    t.string :id, :limit => 36, primary_key: true
  end

  def name_column(t)
    t.string :name, :limit => 64, :required => true
  end

  def label_column(t)
    t.string :label, :limit => 64
  end

  def description_column(t)
    t.string :description, :limit => 512
  end

  def foreign_key_id(t, foreign_key, index = false)
    t.string (foreign_key + '_id').to_sym, :limit => 36, :required => true, index: index
  end

  def remark_column(t)
    t.string :remark, :limit => 64
  end

  def deleted_at(t)
    t.datetime :deleted_at, :required => true, :index => true
  end

  def common_set(t)
    id_column(t)
    deleted_at(t)
    t.timestamps
  end

  def implemented_at(t)
    t.date :implemented_at, :required => true
  end

end