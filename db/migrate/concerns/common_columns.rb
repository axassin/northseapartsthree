module CommonColumns
  extend ActiveSupport::Concern

  def id_column(t)
    t.string :id, :limit => 36
  end

  def name_column(t)
    t.string :name, :limit => 64
  end

  def label_column(t)
    t.string :name, :limit => 64
  end

  def description_column(t)
    t.string :description, :limit => 256
  end

  def system_account_id(t)
    t.string :system_account_id, :limit => 36
  end

end