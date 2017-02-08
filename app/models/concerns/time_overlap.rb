module TimeOverlap extend ActiveSupport::Concern

  included do

    validates :date_of_implementation, presence: true
    validate :overlap

    def overlap
      date_of_implementation_time_in = DateTime.new(date_of_implementation.year, date_of_implementation.month, date_of_implementation.day, time_in.hour, time_in.min, time_in.sec )
      date_of_implementation_time_out = DateTime.new(date_of_implementation.year, date_of_implementation.month, date_of_implementation.day, time_out.hour, time_out.min, time_out.sec )
      AttendanceRecord.all.where(employee_id: employee_id).each do |att_rec|
        other_date_time_in = DateTime.new(att_rec.date_of_implementation.year, att_rec.date_of_implementation.month, att_rec.date_of_implementation.day, att_rec.time_in.hour, att_rec.time_in.min, att_rec.time_in.sec )
        other_date_time_out = DateTime.new(att_rec.date_of_implementation.year, att_rec.date_of_implementation.month, att_rec.date_of_implementation.day, att_rec.time_out.hour, att_rec.time_out.min, att_rec.time_out.sec )

        assessment = (((date_of_implementation_time_in..date_of_implementation_time_out).overlaps?(other_date_time_in..other_date_time_out)) && ( id != att_rec.id))
        if assessment
          puts '--------------- checking overlap --------------'
          puts 'date_of_implementation_time_in : ' + date_of_implementation_time_in.to_s
          puts 'date_of_implementation_time_out : ' + date_of_implementation_time_out.to_s
          puts 'other_date_time_in : ' + other_date_time_in.to_s
          puts 'other_date_time_out : ' + other_date_time_out.to_s
          puts 'belonging to: ' + att_rec.employee.system_account.name
          puts '--------------- ---------------- --------------'
          errors.add(:date_of_implementation, 'Overlap with current Date')
        end
      end
    end

    searchable do
      time :date_of_implementation
      string :date_of_implementation
    end

  end
end