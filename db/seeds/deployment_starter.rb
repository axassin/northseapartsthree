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

special_non_working = HolidayTypes.create!(name: 'SPECIAL-NON-WORKING', base_multiplier: '1.3', rest_day_multiplier: '1.5', date_of_implementation: '')
regular = HolidayTypes.create!(name: 'REGULAR', base_multiplier: '2', rest_day_multiplier: '2.6', date_of_implementation: '')
double = HolidayTypes.create!(name: 'DOUBLE', base_multiplier: '3', rest_day_multiplier: '3', date_of_implementation: '')

Holiday.create!(name: 'NEW YEARS DAY', date: Date.new(2017,1,1), holiday_type: regular)
=begin
Holiday.create!(name: 'NEW YEARS DAY OBSERVED', date: Date.new(2017,1,2), holiday_type_id: 'REGULAR')
Holiday.create!(name: 'CHINESE NEW YEAR', date: Date.new(2017,1,28), holiday_type_id: 'SPECIAL-NON-WORKING')
Holiday.create!(name: 'DAY OF VALOR', date: Date.new(2017,4,9), holiday_type_id: 'REGULAR')
Holiday.create!(name: 'MAUNDY THURSDAY', date: Date.new(2017,4,13), holiday_type_id: 'REGULAR')
Holiday.create!(name: 'Good Friday', date: Date.new(2017,4,14), holiday_type_id: 'REGULAR')
Holiday.create!(name: 'Labor Day', date: Date.new(2017,5,1), holiday_type_id: 'REGULAR')
Holiday.create!(name: 'Independence Day', date: Date.new(2017,5,12), holiday_type_id: 'REGULAR')
Holiday.create!(name: 'Ninoy Aquino Day', date: Date.new(2017,7,21), holiday_type_id: 'SPECIAL-NON-WORKING')
Holiday.create!(name: 'National Heroes Day', date: Date.new(2017,7,28), holiday_type_id: 'REGULAR')
Holiday.create!(name: 'All Saints', date: Date.new(2017,11,1), holiday_type_id: 'REGULAR')
Holiday.create!(name: 'All Souls', date: Date.new(2017,11,2), holiday_type_id: 'REGULAR')
Holiday.create!(name: 'Bonifacio Day', date: Date.new(2017,11,30), holiday_type_id: 'REGULAR')
=end
