puts 'Initializing Database with Starter Data'

# ---------------------- Branch --------------------

if Branch.where(name: 'North Sea Parts').blank?
  north_sea_parts = Branch.create!(name: 'North Sea Parts')
end

# ---------------------- System Accounts -----------------------

if SystemAccount.where(name: 'developer_one').blank?
  developer_one_system_account = SystemAccount.create!(name: 'developer_one', account_type: 'INDIVIDUAL')
  Employee.create!(system_account: developer_one_system_account, branch: north_sea_parts)
end

# ---------------------- System Constants ----------------------
if SystemConstant.where(category_type: 'hr.allowable_work_hours_per_day').blank?
  SystemConstant.create!(category_type: 'hr.allowable_work_hours_per_day',
                         label: 'Allowable Work Hours per Day',
                         value: 8, implemented_on: DateTime.new(2000,1,1,1,1,1)).save!
end

if SystemConstant.where(category_type: 'hr.default_starting_time').blank?
  SystemConstant.create!(category_type: 'hr.default_starting_time',
                         label: 'Default Starting Time',
                         value: '8:00:00', implemented_on: DateTime.new(2000,1,1,1,1,1)).save!
end

if SystemConstant.where(category_type: 'hr.default_ending_time').blank?
  SystemConstant.create!(category_type: 'hr.default_ending_time',
                         label: 'Default Ending Time',
                         value: '17:00:00', implemented_on: DateTime.new(2000,1,1,1,1,1)).save!
end

if SystemConstant.where(category_type: 'hr.allowable_grace_period_late_minutes').blank?
  SystemConstant.create!(category_type: 'hr.allowable_grace_period_late_minutes',
                         label: 'Allowable Grace Period Late Minutes',
                         value: '5', implemented_on: DateTime.new(2000,1,1,1,1,1)).save!
end

# ---------------------- Holiday ----------------------

if DayScheme.where(type_name: 'Regular Day').blank?
  regular_day = DayScheme.create!(type_name: 'Regular Day', base_multiplier: 1, overtime_multiplier: 1.25, rest_day_multiplier: 1.3, overtime_rest_day_multiplier: 1.69, implemented_on: Date.new(2012,1,1)) if SystemConstant.where(category_type: 'hr.allowable_grace_period_late_minutes').blank?
end

if DayScheme.where(type_name: 'Regular Holiday').blank?
  regular_holiday = DayScheme.create!(type_name: 'Regular Holiday', base_multiplier: 2, overtime_multiplier: 2.6, rest_day_multiplier: 2.6, overtime_rest_day_multiplier: 3.38, implemented_on: Date.new(2012,1,1))
end

if DayScheme.where(type_name: 'Special Non-Working Holiday').blank?
  special_non_working = DayScheme.create!(type_name: 'Special Non-Working Holiday', base_multiplier: 1.3, overtime_multiplier: 1.69, rest_day_multiplier: 1.5, overtime_rest_day_multiplier: 1.95, implemented_on: Date.new(2012,1,1))
end

if DayScheme.where(type_name: 'Double').blank?
  double = DayScheme.create!(type_name: 'Double', base_multiplier: 3, overtime_multiplier: 3.9, rest_day_multiplier: 3, overtime_rest_day_multiplier: 5.07, implemented_on: Date.new(2012,1,1))
end

Holiday.create!(name: "New Year's Day", implemented_on: Date.new(2017,1,1), day_scheme: regular_holiday) if Holiday.where(name: "New Year's Day").blank?
Holiday.create!(name: 'Araw ng Kagitingan', implemented_on: Date.new(2017,4,9), day_scheme: regular_holiday) if Holiday.where(name: 'Araw ng Kagitingan').blank?
Holiday.create!(name: 'Maundy Thursday ', implemented_on: Date.new(2017,4,13), day_scheme: regular_holiday) if Holiday.where(name: 'Maundy Thursday ').blank?
Holiday.create!(name: 'Good Friday', implemented_on: Date.new(2017,4,14), day_scheme: regular_holiday) if Holiday.where(name: 'Good Friday').blank?
Holiday.create!(name: 'Labor Day', implemented_on: Date.new(2017,5,1), day_scheme: regular_holiday) if Holiday.where(name: 'Labor Day').blank?
Holiday.create!(name: 'Independence Day', implemented_on: Date.new(2017,6,12), day_scheme: regular_holiday) if Holiday.where(name: 'Independence Day').blank?
Holiday.create!(name: "National Heroes' Day", implemented_on: Date.new(2017,8,28), day_scheme: regular_holiday) if Holiday.where(name: "National Heroes' Day").blank?
Holiday.create!(name: 'Bonifacio Day', implemented_on: Date.new(2017,11,30), day_scheme: regular_holiday) if Holiday.where(name: 'Bonifacio Day').blank?
Holiday.create!(name: 'Christmas Day', implemented_on: Date.new(2017,12,25), day_scheme: regular_holiday) if Holiday.where(name: 'Christmas Day').blank?
Holiday.create!(name: 'Rizal Day', implemented_on: Date.new(2017,12,30), day_scheme: regular_holiday) if Holiday.where(name: 'Rizal Day').blank?

Holiday.create!(name: 'Proclamation 117', implemented_on: Date.new(2017,1,2), day_scheme: special_non_working) if Holiday.where(name: 'Proclamation 117').blank?
Holiday.create!(name: 'Chinese New Year', implemented_on: Date.new(2017,1,28), day_scheme: special_non_working) if Holiday.where(name: 'Chinese New Year').blank?
Holiday.create!(name: 'EDSA Revolution Anniversary', implemented_on: Date.new(2017,2,25), day_scheme: special_non_working) if Holiday.where(name: 'EDSA Revolution Anniversary').blank?
Holiday.create!(name: 'Black Saturday', implemented_on: Date.new(2017,4,15), day_scheme: special_non_working) if Holiday.where(name: 'Black Saturday').blank?
Holiday.create!(name: 'Ninoy Aquino Day', implemented_on: Date.new(2017,8,21), day_scheme: special_non_working) if Holiday.where(name: 'Ninoy Aquino Day').blank?
Holiday.create!(name: 'additional special (non-working) day', implemented_on: Date.new(2017,10,31), day_scheme: special_non_working) if Holiday.where(name: 'additional special (non-working) day').blank?
Holiday.create!(name: 'All Saints Day', implemented_on: Date.new(2017,11,1), day_scheme: special_non_working) if Holiday.where(name: 'All Saints Day').blank?
Holiday.create!(name: 'Last day of the year', implemented_on: Date.new(2017,12,31), day_scheme: special_non_working) if Holiday.where(name: 'Last day of the year').blank?

# ---------------------- Expenses ----------------------

if ExpenseCategory.where(name: 'General Expenses').blank?
  general_expenses = ExpenseCategory.create!(name: 'General Expenses', remark: nil)

  utilities = ExpenseCategory.create!(name: 'Utilities', remark: nil, parent: general_expenses)
  ExpenseCategory.create!(name: 'Water', remark: nil, parent: utilities)
  ExpenseCategory.create!(name: 'Electricity', remark: nil, parent: utilities)
  ExpenseCategory.create!(name: 'Telephone', remark: nil, parent: utilities)
  ExpenseCategory.create!(name: 'Internet', remark: nil, parent: utilities)
  ExpenseCategory.create!(name: 'Gas', remark: nil, parent: utilities)
  ExpenseCategory.create!(name: 'Cable', remark: nil, parent: utilities)

  maintenance = ExpenseCategory.create!(name: 'Maintenance Expenses', remark: nil, parent: general_expenses)

  business_insurance = ExpenseCategory.create!(name: 'Business Insurance', remark: nil, parent: general_expenses)
  ExpenseCategory.create!(name: 'Car', remark: nil, parent: business_insurance)
  ExpenseCategory.create!(name: 'Employee', remark: nil, parent: business_insurance)

  auxiliary_supplies = ExpenseCategory.create!(name: 'Auxiliary Supplies', remark: nil, parent: general_expenses)

  professional_fees = ExpenseCategory.create!(name: 'Professional Fees', remark: nil, parent: general_expenses)
  ExpenseCategory.create!(name: 'Bookeeping Fee', remark: nil, parent: professional_fees)
  ExpenseCategory.create!(name: 'Broker', remark: nil, parent: professional_fees)

  taxes_and_licenses = ExpenseCategory.create!(name: 'Taxes and Licenses', remark: nil, parent: general_expenses)
  ExpenseCategory.create!(name: 'Vehicle Registration', remark: nil, parent: taxes_and_licenses)
  ExpenseCategory.create!(name: 'Local Taxes', remark: nil, parent: taxes_and_licenses)
  ExpenseCategory.create!(name: 'Residence Certificate', remark: nil, parent: taxes_and_licenses)
  ExpenseCategory.create!(name: 'Barangay Clearance', remark: nil, parent: taxes_and_licenses)
  national_taxes = ExpenseCategory.create!(name: 'National Taxes', remark: nil, parent: taxes_and_licenses)
  ExpenseCategory.create!(name: 'Annual Registration Fee', remark: nil, parent: national_taxes)

  miscellaneous = ExpenseCategory.create!(name: 'Miscellaneous', remark: nil, parent: general_expenses)
end


StorageUnit.create!(code: 'NORTHSEA') if StorageUnit.where(code: 'NORTHSEA').blank?
StorageUnit.create!(code: 'GRECO') if StorageUnit.where(code: 'GRECO').blank?

# Development Login
if User.where(email: 'developer_one@gmail.com').blank?
  developer_one = User.new(system_account: developer_one_system_account, email: 'developer_one@gmail.com', password: 'ilovetess', password_confirmation: 'ilovetess')
  developer_one.skip_confirmation!
  developer_one.save!
end
