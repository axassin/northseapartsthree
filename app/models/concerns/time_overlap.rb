module TimeOverlap extend ActiveSupport::Concern

  included do

    validate :overlap

    def overlap
      implemented_at_time_in = DateTime.new(implemented_at.year, implemented_at.month, implemented_at.day, time_in.hour, time_in.min, time_in.sec )
      implemented_at_time_out = DateTime.new(implemented_at.year, implemented_at.month, implemented_at.day, time_out.hour, time_out.min, time_out.sec )
      AttendanceRecord.all.where(employee_id: employee_id).each do |att_rec|
        other_date_time_in = DateTime.new(att_rec.implemented_at.year, att_rec.implemented_at.month, att_rec.implemented_at.day, att_rec.time_in.hour, att_rec.time_in.min, att_rec.time_in.sec )
        other_date_time_out = DateTime.new(att_rec.implemented_at.year, att_rec.implemented_at.month, att_rec.implemented_at.day, att_rec.time_out.hour, att_rec.time_out.min, att_rec.time_out.sec )

        assessment = (((implemented_at_time_in..implemented_at_time_out).overlaps?(other_date_time_in..other_date_time_out)) && ( id != att_rec.id))
        if assessment
          puts '--------------- checking overlap --------------'
          puts 'implemented_at_time_in : ' + implemented_at_time_in.to_s
          puts 'implemented_at_time_out : ' + implemented_at_time_out.to_s
          puts 'other_date_time_in : ' + other_date_time_in.to_s
          puts 'other_date_time_out : ' + other_date_time_out.to_s
          puts 'belonging to: ' + att_rec.employee.system_account.name
          puts '--------------- ---------------- --------------'
          errors.add(:implemented_at, 'Overlap with current Date')
        end
      end
    end

  end
end