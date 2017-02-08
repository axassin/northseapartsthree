module TimeOverlap extend ActiveSupport::Concern

  included do

    validates :current_date, presence: true
    validate :overlap

    def overlap
      current_date_time_in = DateTime.new(current_date.year, current_date.month, current_date.day, time_in.hour, time_in.min, time_in.sec )
      current_date_time_out = DateTime.new(current_date.year, current_date.month, current_date.day, time_out.hour, time_out.min, time_out.sec )
      AttendanceRecord.all.where(employee_id: employee_id).each do |att_rec|
        other_date_time_in = DateTime.new(att_rec.current_date.year, att_rec.current_date.month, att_rec.current_date.day, att_rec.time_in.hour, att_rec.time_in.min, att_rec.time_in.sec )
        other_date_time_out = DateTime.new(att_rec.current_date.year, att_rec.current_date.month, att_rec.current_date.day, att_rec.time_out.hour, att_rec.time_out.min, att_rec.time_out.sec )

        assessment = (((current_date_time_in..current_date_time_out).overlaps?(other_date_time_in..other_date_time_out)) && ( id != att_rec.id))
        if assessment
          puts '--------------- checking overlap --------------'
          puts 'current_date_time_in : ' + current_date_time_in.to_s
          puts 'current_date_time_out : ' + current_date_time_out.to_s
          puts 'other_date_time_in : ' + other_date_time_in.to_s
          puts 'other_date_time_out : ' + other_date_time_out.to_s
          puts 'belonging to: ' + att_rec.employee.system_account.name
          puts '--------------- ---------------- --------------'
          errors.add(:current_date, 'Overlap with current Date')
        end
      end
    end

    searchable do
      time :current_date
      string :current_date
    end

  end
end