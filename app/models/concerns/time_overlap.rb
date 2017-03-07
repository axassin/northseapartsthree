module TimeOverlap extend ActiveSupport::Concern

  included do

    validate :overlap
    validates_time :time_in
    validates_time :time_out

    def overlap
      implemented_on_time_in = DateTime.new(implemented_on.year, implemented_on.month, implemented_on.day, time_in.hour, time_in.min, time_in.sec )
      implemented_on_time_out = DateTime.new(implemented_on.year, implemented_on.month, implemented_on.day, time_out.hour, time_out.min, time_out.sec )
      AttendanceRecord.all.where(employee_id: employee_id).each do |att_rec|
        other_date_time_in = DateTime.new(att_rec.implemented_on.year, att_rec.implemented_on.month, att_rec.implemented_on.day, att_rec.time_in.hour, att_rec.time_in.min, att_rec.time_in.sec )
        other_date_time_out = DateTime.new(att_rec.implemented_on.year, att_rec.implemented_on.month, att_rec.implemented_on.day, att_rec.time_out.hour, att_rec.time_out.min, att_rec.time_out.sec )

        assessment = (((implemented_on_time_in..implemented_on_time_out).overlaps?(other_date_time_in..other_date_time_out)) && ( id != att_rec.id))
        if assessment
          puts '--------------- checking overlap --------------'
          puts 'implemented_on_time_in : ' + implemented_on_time_in.to_s
          puts 'implemented_on_time_out : ' + implemented_on_time_out.to_s
          puts 'other_date_time_in : ' + other_date_time_in.to_s
          puts 'other_date_time_out : ' + other_date_time_out.to_s
          puts 'belonging to: ' + att_rec.employee.system_account.name
          puts '--------------- ---------------- --------------'
          errors.add(:implemented_on, 'Overlap with current Date')
        end
      end
    end

  end
end