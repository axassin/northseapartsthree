puts 'Initializing Database with Starter Data'

# ---------------------- Branch --------------------

north_sea_parts = Branch.create!(name: 'North Sea Parts')

# ---------------------- System Accounts -----------------------

developer_one_system_account = SystemAccount.create!(name: 'developer_one', account_type: 'INDIVIDUAL')
Employee.create!(system_account: developer_one_system_account, branch: north_sea_parts)

# ---------------------- System Constants ----------------------
SystemConstant.create!(category_type: 'hr.allowable_work_hours_per_day',
                       label: 'Allowable Work Hours per Day',
                       value: 8, implemented_on: DateTime.new(2000,1,1,1,1,1)).save!

SystemConstant.create!(category_type: 'hr.default_starting_time',
                       label: 'Default Starting Time',
                       value: '8:00:00', implemented_on: DateTime.new(2000,1,1,1,1,1)).save!

SystemConstant.create!(category_type: 'hr.default_ending_time',
                       label: 'Default Ending Time',
                       value: '17:00:00', implemented_on: DateTime.new(2000,1,1,1,1,1)).save!

SystemConstant.create!(category_type: 'hr.allowable_grace_period_late_minutes',
                       label: 'Allowable Grace Period Late Minutes',
                       value: '5', implemented_on: DateTime.new(2000,1,1,1,1,1)).save!

# ---------------------- Holiday ----------------------
regular_day = DayScheme.create!(type_name: 'Regular Day', base_multiplier: 1, overtime_multiplier: 1.25, rest_day_multiplier: 1.3, overtime_rest_day_multiplier: 1.69, implemented_on: Date.new(2012,1,1))
regular_holiday = DayScheme.create!(type_name: 'Regular Holiday', base_multiplier: 2, overtime_multiplier: 2.6, rest_day_multiplier: 2.6, overtime_rest_day_multiplier: 3.38, implemented_on: Date.new(2012,1,1))
special_non_working = DayScheme.create!(type_name: 'Special Non-Working Holiday', base_multiplier: 1.3, overtime_multiplier: 1.69, rest_day_multiplier: 1.5, overtime_rest_day_multiplier: 1.95, implemented_on: Date.new(2012,1,1))
double = DayScheme.create!(type_name: 'Double', base_multiplier: 3, overtime_multiplier: 3.9, rest_day_multiplier: 3, overtime_rest_day_multiplier: 5.07, implemented_on: Date.new(2012,1,1))

Holiday.create!(name: "New Year's Day", implemented_on: Date.new(2017,1,1), day_scheme: regular_holiday)
Holiday.create!(name: 'Araw ng Kagitingan', implemented_on: Date.new(2017,4,9), day_scheme: regular_holiday)
Holiday.create!(name: 'Maundy Thursday ', implemented_on: Date.new(2017,4,13), day_scheme: regular_holiday)
Holiday.create!(name: 'Good Friday', implemented_on: Date.new(2017,4,14), day_scheme: regular_holiday)
Holiday.create!(name: 'Labor Day', implemented_on: Date.new(2017,5,1), day_scheme: regular_holiday)
Holiday.create!(name: 'Independence Day', implemented_on: Date.new(2017,6,12), day_scheme: regular_holiday)
Holiday.create!(name: "National Heroes' Day", implemented_on: Date.new(2017,8,28), day_scheme: regular_holiday)
Holiday.create!(name: 'Bonifacio Day', implemented_on: Date.new(2017,11,30), day_scheme: regular_holiday)
Holiday.create!(name: 'Christmas Day', implemented_on: Date.new(2017,12,25), day_scheme: regular_holiday)
Holiday.create!(name: 'Rizal Day', implemented_on: Date.new(2017,12,30), day_scheme: regular_holiday)

Holiday.create!(name: 'Proclamation 117', implemented_on: Date.new(2017,1,2), day_scheme: special_non_working)
Holiday.create!(name: 'Chinese New Year', implemented_on: Date.new(2017,1,28), day_scheme: special_non_working)
Holiday.create!(name: 'EDSA Revolution Anniversary', implemented_on: Date.new(2017,2,25), day_scheme: special_non_working)
Holiday.create!(name: 'Black Saturday', implemented_on: Date.new(2017,4,15), day_scheme: special_non_working)
Holiday.create!(name: 'Ninoy Aquino Day', implemented_on: Date.new(2017,8,21), day_scheme: special_non_working)
Holiday.create!(name: 'additional special (non-working) day', implemented_on: Date.new(2017,10,31), day_scheme: special_non_working)
Holiday.create!(name: 'All Saints Day', implemented_on: Date.new(2017,11,1), day_scheme: special_non_working)
Holiday.create!(name: 'Last day of the year', implemented_on: Date.new(2017,12,31), day_scheme: special_non_working)

# ---------------------- Expenses ----------------------
utilities = ExpenseCategory.create!(name: 'Utilities', remark: nil)
ExpenseCategory.create!(name: 'Water', remark: nil, parent: utilities)
ExpenseCategory.create!(name: 'Electricity', remark: nil, parent: utilities)
ExpenseCategory.create!(name: 'Telephone', remark: nil, parent: utilities)
ExpenseCategory.create!(name: 'Internet', remark: nil, parent: utilities)
ExpenseCategory.create!(name: 'Gas', remark: nil, parent: utilities)
ExpenseCategory.create!(name: 'Cable', remark: nil, parent: utilities)

maintenance_expenses = ExpenseCategory.create!(name: 'Maintenance Expenses', remark: nil)

business_insurance = ExpenseCategory.create!(name: 'Business Insurance', remark: nil)
ExpenseCategory.create!(name: 'Car', remark: nil, parent: business_insurance)
ExpenseCategory.create!(name: 'Employee', remark: nil, parent: business_insurance)

auxiliary_supplies = ExpenseCategory.create!(name: 'Auxiliary Supplies', remark: nil)
office = ExpenseCategory.create!(name: 'Office', remark: nil, parent: auxiliary_supplies)
ExpenseCategory.create!(name: 'Ballpens', remark: nil, parent: office)
ExpenseCategory.create!(name: 'Paper', remark: nil, parent: office)

professional_fees = ExpenseCategory.create!(name: 'Professional Fees', remark: nil)
ExpenseCategory.create!(name: 'Accountant', remark: nil, parent: professional_fees)
ExpenseCategory.create!(name: 'Broker', remark: nil, parent: professional_fees)

taxes = ExpenseCategory.create!(name: 'Taxes', remark: nil)
miscellaneous = ExpenseCategory.create!(name: 'Miscellaneous', remark: nil)

StorageUnit.create!(code: 'NS')
StorageUnit.create!(code: 'GR')

# Development Login
developer_one = User.new(system_account: developer_one_system_account, email: 'developer_one@gmail.com', password: 'ilovetess', password_confirmation: 'ilovetess')
developer_one.skip_confirmation!
developer_one.save!

