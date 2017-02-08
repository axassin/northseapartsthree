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

regular_day = DayScheme.create!(type_name: 'Regular Day', base_multiplier: 1, overtime_multiplier: 1.25, rest_day_multiplier: 1.3, overtime_rest_day_multiplier: 1.69, implemented_at: Date.new(2012,1,1))
regular_holiday = DayScheme.create!(type_name: 'Regular Holiday', base_multiplier: 2, overtime_multiplier: 2.6, rest_day_multiplier: 2.6, overtime_rest_day_multiplier: 3.38, implemented_at: Date.new(2012,1,1))
special_non_working = DayScheme.create!(type_name: 'Special Non-Working Holiday', base_multiplier: 1.3, overtime_multiplier: 1.69, rest_day_multiplier: 1.5, overtime_rest_day_multiplier: 1.95, implemented_at: Date.new(2012,1,1))
double = DayScheme.create!(type_name: 'Double', base_multiplier: 3, overtime_multiplier: 3.9, rest_day_multiplier: 3, overtime_rest_day_multiplier: 5.07, implemented_at: Date.new(2012,1,1))

Holiday.create!(name: "New Year's Day", implemented_at: Date.new(2017,1,1), day_scheme: regular_day)
Holiday.create!(name: 'Araw ng Kagitingan', implemented_at: Date.new(2017,4,9), day_scheme: regular_day)
Holiday.create!(name: 'Maundy Thursday ', implemented_at: Date.new(2017,4,13), day_scheme: regular_day)
Holiday.create!(name: 'Good Friday', implemented_at: Date.new(2017,4,14), day_scheme: regular_day)
Holiday.create!(name: 'Labor Day', implemented_at: Date.new(2017,5,1), day_scheme: regular_day)
Holiday.create!(name: 'Independence Day', implemented_at: Date.new(2017,6,12), day_scheme: regular_day)
Holiday.create!(name: "National Heroes' Day", implemented_at: Date.new(2017,8,28), day_scheme: regular_day)
Holiday.create!(name: 'Bonifacio Day', implemented_at: Date.new(2017,11,30), day_scheme: regular_day)
Holiday.create!(name: 'Christmas Day', implemented_at: Date.new(2017,12,25), day_scheme: regular_day)
Holiday.create!(name: 'Rizal Day', implemented_at: Date.new(2017,12,30), day_scheme: regular_day)

Holiday.create!(name: 'Proclamation 117', implemented_at: Date.new(2017,1,2), day_scheme: special_non_working)
Holiday.create!(name: 'Chinese New Year', implemented_at: Date.new(2017,1,28), day_scheme: special_non_working)
Holiday.create!(name: 'EDSA Revolution Anniversary', implemented_at: Date.new(2017,2,25), day_scheme: special_non_working)
Holiday.create!(name: 'Black Saturday', implemented_at: Date.new(2017,4,15), day_scheme: special_non_working)
Holiday.create!(name: 'Ninoy Aquino Day', implemented_at: Date.new(2017,8,21), day_scheme: special_non_working)
Holiday.create!(name: 'additional special (non-working) day', implemented_at: Date.new(2017,10,31), day_scheme: special_non_working)
Holiday.create!(name: 'All Saints Day', implemented_at: Date.new(2017,11,1), day_scheme: special_non_working)
Holiday.create!(name: 'Last day of the year', implemented_at: Date.new(2017,12,31), day_scheme: special_non_working)