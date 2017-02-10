module TimePrecedence extend ActiveSupport::Concern

  included do

    validates :time_in, presence: true
    validates :time_out, presence: true
    validates_time :time_in, :before => :time_out
    validates_time :time_out, :after => :time_in
    validate :time_precedence

    def time_precedence
      if time_in >= time_out
        errors.add(:time_in, 'Time In must be before Time Out')
      end
    end

    searchable do
      time :time_in
      string :time_in

      time :time_out
      string :time_out
    end

  end
end