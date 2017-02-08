puts 'Initializing Database with Starter Data'

SystemConstant.create!(category_type: 'hr.allowable_work_hours_per_day',
                       label: 'Allowable Work Hours per Day',
                       value: 8).save!

SystemConstant.create!(category_type: 'hr.default_starting_time',
                       label: 'Default Starting Time',
                       value: '8:00:00').save!

SystemConstant.create!(category_type: 'hr.default_ending_time',
                       label: 'Default Ending Time',
                       value: '17:00:00').save!