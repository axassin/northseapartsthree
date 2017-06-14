module TimePrecedence extend ActiveSupport::Concern

  included do

    validates :time_in, presence: true
    validates :time_out, presence: true

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

  def time_period
    time_in.strftime('%R') + ' to ' + time_out.strftime('%R')
  end

end