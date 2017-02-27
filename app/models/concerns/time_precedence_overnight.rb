module TimePrecedenceOvernight extend ActiveSupport::Concern

  included do

    validates :time_in, presence: true
    validates :time_out, presence: true
    validates_time :time_in, :after => :time_out
    validates_time :time_out, :before => :time_in

    searchable do
      time :time_in
      string :time_in

      time :time_out
      string :time_out
    end

  end

end