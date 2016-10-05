module CommonColumns
  extend ActiveSupport::Concern

  def id_column(t)
    t.string :name, :limit => 64
  end

  def name_column(t)
    t.string :name, :limit => 64
  end

  def description_column(t)
    t.string :description, :limit => 256
  end

end