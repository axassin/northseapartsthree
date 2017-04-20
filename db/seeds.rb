# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require File.expand_path('../seeds/deployment_starter', __FILE__)

puts " Initializing Database with Sample Data for Production and Development Environment"

# Execute only in a Development Environment; This is "fake" sample data
if Rails.env.development? || Rails.env.test?

  # --------------------- Shorthand Functions ---------------------
  def establish_contact_details(model, id)

    rand(0..2).times do

      # Contact Detail
      current_contact_detail = ContactDetail.create!(
          label: %w(HOME MAIN-BRANCH SUB-BRANCH WAREHOUSE DELIVERY).sample,
          contactable_type: model,
          contactable_id: id)

      current_contact_detail.save!

      # Telephone Number
      rand(0..2).times do
        TelephoneNumber.create!(contact_detail: current_contact_detail,
                                remark: Faker::Lorem.sentence(3, false, 0),
                                digits: Faker::Number.number( rand(7..64)) )
      end

      # Link
      rand(0..2).times do
        Link.create!(contact_detail: current_contact_detail,
                     service: %w(EMAIL SKYPE VIBER).sample,
                     url: Faker::Internet.user_name,
                     remark: Faker::Company.name )
      end

      # Address
      rand(0..2).times do
        aggregated_address = Faker::Address.street_address + Faker::Address.city + Faker::Address.state
        Location.create!(contact_detail: current_contact_detail,
                         latitude: Faker::Address.latitude,
                         longitude: Faker::Address.longitude,
                         address: aggregated_address)
      end

    end
  end

  def establish_file(model, id)

    current_file = ['sample_file_01.txt',
                    'sample_file_02.txt',
                    'sample_file_03.txt',
                    'sample_file_04.txt',
                    'sample_file_05.txt',
                    ''].sample

    rand(0..2).times do

      associated_file = AssociatedFile.create!(
          description: Faker::Lorem.sentence(3, false, 0),
          name: Faker::Commerce.product_name,
          file: current_file,
          fileable_type: model,
          fileable_id: id
      )

      associated_file[:file] = current_file
      associated_file.save!
    end
  end

  def establish_image(model, id)

    current_file = %w(sample_image_01.jpg sample_image_02.jpg sample_image_03.jpg sample_image_04.jpg sample_image_05.jpg).sample

    rand(0..2).times do

      associated_image = AssociatedImage.create!(
          description: Faker::Lorem.sentence(3, false, 0),
          name: Faker::Commerce.product_name,
          image: current_file,
          imageable_type: model,
          imageable_id: id
      )

      associated_image[:image] = current_file
      associated_image.save!
    end
  end

  def generate_system_account(account_type)

    current_image = ['sample_system_account_01.jpg',
                     'sample_system_account_02.jpg',
                     'sample_system_account_03.jpg',
                     'sample_system_account_04.jpg',
                     'sample_system_account_05.jpg',
                     ''].sample

    if account_type == 'GROUP'
      current_name = Faker::Company.name
    else
      current_name = Faker::Name.name
    end


    current_system_account = SystemAccount.create!(name: current_name,
                                                   description: Faker::Lorem.sentence,
                                                   account_type: account_type)

    current_system_account[:primary_image] = current_image
    current_system_account.save!
    establish_contact_details(SystemAccount, current_system_account.id)
    establish_image(SystemAccount, current_system_account.id)
    establish_file(SystemAccount, current_system_account.id)
    current_system_account

  end

  def random_system_account
    # MySQL Implementation
    SystemAccount.order("RAND()").first
  end

  NO_OF_UNA_SYS_ACC = 10
  NO_OF_UNA_SYS_ACC.times {
    generate_system_account(['INDIVIDUAL','GROUP'].sample)
  }

  # --------------------- Generate Sample Data ---------------------

  # Branches
  NO_OF_BRANCHES = 3
  NO_OF_BRANCHES.times {
    current_branch = Branch.create!(
        name: Faker::Company.name,
        description: Faker::Lorem.sentence
    )

    current_branch.save
    establish_contact_details(Branch, current_branch.id)
    establish_file(Branch, current_branch.id)
  }

  # Vehicles
  NO_OF_VEHICLES = 25
  NO_OF_VEHICLES.times {
    current_vehicle = Vehicle.new
    current_vehicle.color = Faker::Color.color_name
    current_vehicle.make = %w(TRUCK PICKUP VAN SEDAN).sample
    current_vehicle.brand = Faker::Company.name
    current_vehicle.plate_number = Faker::Lorem.characters(6)
    current_image = ['sample_vehicle_01.jpg',
                     'sample_vehicle_02.png',
                     'sample_vehicle_03.jpg',
                     'sample_vehicle_04.png',
                     'sample_vehicle_05.jpg',
                     ''].sample
    current_vehicle[:primary_image] = current_image

    current_vehicle.fuel_type = %w(DIESEL GASOLINE).sample
    current_vehicle.description = Faker::Lorem.paragraph
    current_vehicle.date_of_registration = Faker::Time.between(DateTime.now - 3600, DateTime.now)
    current_vehicle.save!
    establish_image(Vehicle, current_vehicle.id)
    establish_file(Vehicle, current_vehicle.id)
  }

  # Banks
  no_of_banks = 10
  no_of_banks.times {
    bank = Bank.new
    bank.system_account_id = generate_system_account('GROUP').id
    bank.remark = Faker::Lorem.sentence(3, false, 0)
    bank.save!
    no_of_bank_accounts = 10
    no_of_bank_accounts.times {
      bank_account = BankAccount.new
      bank_account.bank = bank
      bank_account.system_account_id = random_system_account.id
      bank_account.account_number = Faker::Code.imei
      bank_account.remark = Faker::Lorem.sentence(3, false, 0)
      bank_account.save!
    }
  }

  # Employees
  NO_OF_EMPLOYEES = 30
  NO_OF_EMPLOYEES.times do

    current_employee = Employee.create!(system_account: generate_system_account('INDIVIDUAL'),
                                        branch: Branch.offset(rand(Branch.count)).first,
                                        position: Faker::Lorem.sentence(1))

    current_employee.save!

    # Rest Day for Employee
    rand(1..3).times do
      RestDay.create!(implemented_on: Faker::Time.between(DateTime.now - 3600, DateTime.now),
                      employee: current_employee,
                      remark: Faker::Lorem.sentence(3, false, 0),
                      day: %w(MONDAY TUESDAY WEDNESDAY THURSDAY FRIDAY SATURDAY SUNDAY).sample)
    end

    # Regular Work Period
    rand(1..3).times do

      # Regular
      generated_time_in = '08:00'
      generated_time_out = '17:00'
      one_hour_break = 1

      # Regular with Lunch Break
      30.in(100) do
        start_time = DateTime.new(2002, 10, 31, 0, 0, 1)
        end_time = DateTime.new(2002, 10, 31, 12, 59, 59)
        base_time = Faker::Time.between(start_time, end_time, :morning)
        generated_time_in = base_time.strftime('%H:%M')
        generated_time_out = (base_time + 9.hours).strftime('%H:%M')
        one_hour_break = 1
      end

      # Regular with no Lunch Break
      30.in(100) do
        start_time = DateTime.new(2002, 10, 31, 0, 0, 1)
        end_time = DateTime.new(2002, 10, 31, 12, 59, 59)
        base_time = Faker::Time.between(start_time, end_time, :morning)
        generated_time_in = base_time.strftime('%H:%M')
        generated_time_out = (base_time + 8.hours).strftime('%H:%M')
        one_hour_break = 0
      end

      RegularWorkPeriod.create!(implemented_on: Faker::Time.between(DateTime.now - 3600, DateTime.now),
                                employee: current_employee,
                                remark: Faker::Lorem.sentence(3, false, 0),
                                time_in: generated_time_in,
                                time_out: generated_time_out,
                                one_hour_break: one_hour_break)
    end

    # Biodata for Employee
    50.in(100) do
      current_biodata = Biodatum.create!(
          employee_id: current_employee.id,
          name_of_mother: Faker::Name.name,
          name_of_father: Faker::Name.name,
          dependents: Faker::Lorem.sentence(10),
          complexion: ['light','medium','dark','eurasia',''].sample,
          height: ['5 feet 7 inches','32cm','3226cm','33cm','21 in',''].sample,
          sex: ['FEMALE','MALE',''].sample,
          blood_type: ['O+','O-','A+','A-','B+','B-','AB+','AB-',''].sample,
          education: Faker::Lorem.sentence(10),
          experience: Faker::Lorem.sentence(10),
          notable_accomplishment: Faker::Lorem.sentence(10),
          description: Faker::Lorem.sentence(10),
          date_of_birth: Faker::Date.between(80.years.ago, 10.years.ago)
      )
      current_biodata.save
    end

    # Employee Status for Employee
    rand(0..5).times do
      current_employee_status = EmployeeStatus.create!(
          employee_id: current_employee.id,
          implemented_on: Faker::Date.between(6.years.ago, 1.years.ago),
          state: ['ACTIVE','INACTIVE'].sample,
          remark: Faker::Lorem.sentence(3, false, 0)
      )
      current_employee_status.save
    end

    # Attendance Records for Employee
    rand(0..50).times do

      generated_date = Faker::Date.between(2.weeks.ago, Date.today)
      generated_year = generated_date.year
      generated_month = generated_date.month
      generated_day = generated_date.day

      earliest_time_in = Time.new(generated_year, generated_month, generated_day, 0, 0 ,0)
      latest_time_out = Time.new(generated_year, generated_month, generated_day, 23, 59, 59)

      generated_time_in = Faker::Time.between(earliest_time_in, latest_time_out, :all)
      generated_time_out = Faker::Time.between(earliest_time_in, latest_time_out, :all)
      exact_time_in_first_half = Time.new(generated_year, generated_month, generated_day, 8, 0 ,0)
      exact_time_out_first_half = Time.new(generated_year, generated_month, generated_day, 12, 0 ,0)
      exact_time_in_second_half = Time.new(generated_year, generated_month, generated_day, 13, 0 ,0)
      exact_time_out_second_half = Time.new(generated_year, generated_month, generated_day, 17, 0 ,0)

      time_in = [generated_time_in, exact_time_in_first_half, exact_time_in_second_half].sample
      time_out = [generated_time_out, exact_time_out_first_half, exact_time_out_second_half].sample

      5.in(10) do
        time_in = Time.new(generated_year, generated_month, generated_day, 8, 0 ,0)
        time_out = Time.new(generated_year, generated_month, generated_day, 12, 0 ,0)
      end

      5.in(10) do
        time_in = Time.new(generated_year, generated_month, generated_day, 13, 0 ,0)
        time_out = Time.new(generated_year, generated_month, generated_day, 17, 0 ,0)
      end

      # Time Precedence
      while time_in.to_i >= time_out.to_i
        time_out = Faker::Time.between(earliest_time_in, latest_time_out, :all)
      end

      # Time Overlap
      save_flag = true
      implemented_on_time_in = DateTime.new(generated_year, generated_month, generated_day, time_in.hour, time_in.min, time_in.sec )
      implemented_on_time_out = DateTime.new(generated_year, generated_month, generated_day, time_out.hour, time_out.min, time_out.sec )
      AttendanceRecord.all.where(employee_id: current_employee.id).each do |att_rec|
        other_date_time_in = DateTime.new(att_rec.implemented_on.year, att_rec.implemented_on.month, att_rec.implemented_on.day, att_rec.time_in.hour, att_rec.time_in.min, att_rec.time_in.sec )
        other_date_time_out = DateTime.new(att_rec.implemented_on.year, att_rec.implemented_on.month, att_rec.implemented_on.day, att_rec.time_out.hour, att_rec.time_out.min, att_rec.time_out.sec )
        assessment = (((implemented_on_time_in..implemented_on_time_out).overlaps?(other_date_time_in..other_date_time_out)) && ( current_employee.id != att_rec.id))
        if assessment
          save_flag = false
          break;
        end
      end

      if save_flag
        AttendanceRecord.create!(
            employee_id: current_employee.id,
            remark: Faker::Lorem.sentence(3, false, 0),
            implemented_on: generated_date,
            time_in: time_in,
            time_out: time_out
        )
      end
    end
  end

  # Greco Items Temporary Inventory
  no_of_parts = 20
  no_of_parts.times {
    greco_item = GrecoItem.new
    greco_item.name = Faker::Commerce.product_name
    greco_item.remark = Faker::Commerce.product_name
    greco_item.save!

    5.times {
      greco_transaction = GrecoTransaction.new
      greco_transaction.greco_item = greco_item
      greco_transaction.implemented_on = Faker::Date.between(2.weeks.ago, Date.today)
      greco_transaction.quantity = rand(5..200)
      greco_transaction.transaction_code = Faker::Code.isbn
      greco_transaction.transaction_type = ['STORE','RETRIEVE'].sample
      greco_transaction.remark = Faker::Commerce.product_name
      greco_transaction.save!
    }
  }

  # Vendor
  no_of_exchange_mediums = 25
  no_of_exchange_mediums.times {
    vendor = Vendor.new
    vendor.system_account = generate_system_account('GROUP')
    vendor.save!
  }

  # Expense Entries
  no_of_expense_entries = 25
  no_of_expense_entries.times {
    expense_entry = ExpenseEntry.new
    expense_entry.vendor_id = Vendor.order("RAND()").first.id
    expense_entry.requesting_party_id = Employee.order("RAND()").first.id
    has_children_flag = true
    while has_children_flag
      current_expense_category = ExpenseCategory.order("RAND()").first
      unless current_expense_category.has_children?
        expense_entry.expense_category_id = current_expense_category.id
        has_children_flag = false
      end
    end
    expense_entry.amount_centavos = Faker::Commerce.price*100.00
    expense_entry.amount_currency = ['USD','PHP','NTD'].sample
    expense_entry.due_date = Faker::Date.between(2.weeks.ago, Date.today)
    expense_entry.reference_number = Faker::Code.isbn
    expense_entry.save!
  }

  # Expense Assignment
  no_of_expense_assignment = 25
  no_of_expense_assignment.times {
    expense_assignment = ExpenseAssignment.new
    expense_assignment.expense_entry_id = ExpenseEntry.order("RAND()").first.id
    expense_assignment.remark = Faker::Lorem.sentence(3, false, 0)
    expensable_type = ['Vehicle','Employee','Branch'].sample
    expense_assignment.expensable_id = expensable_type.constantize.order("RAND()").first.id
    expense_assignment.expensable_type = expensable_type
    expense_assignment.save!
  }

  # Exchange Medium
  no_of_exchange_mediums = 50
  no_of_exchange_mediums.times {

    exchange_medium = ExchangeMedium.new
    exchange_medium.amount_centavos = Faker::Commerce.price*100.00
    exchange_medium.amount_currency = ['USD','PHP','NTD'].sample
    exchange_medium.remark = Faker::Commerce.product_name
    exchange_medium.implemented_at = Faker::Time.between(2.months.ago, Date.today, :all)
    # Change when expenses come online
    exchange_medium.transaction_type = 'EXPENSE'
    exchange_medium.transaction_id = Faker::Code.isbn
    exchange_medium.save!

    exchange_medium_type = ['CASH','CHECK', 'BANK_TRANSFER'].sample
    case exchange_medium_type
      when 'CASH'
        cash = Cash.new
        cash.denomination = Faker::Lorem.sentence(3, false, 0)
        cash.reference_number = Faker::Code.isbn
        cash.exchange_medium = exchange_medium
        cash.save!
      when 'CHECK'
        check = Check.new
        check.bank_account = BankAccount.order("RAND()").first
        check.check_number = Faker::Code.isbn
        check.dated = Faker::Time.between(2.months.ago, Date.today, :all)
        check.payee = random_system_account.id
        check.signatory = random_system_account.id
        check.exchange_medium = exchange_medium
        check.save!
      when 'BANK_TRANSFER'
        bank_transfer = BankTransfer.new
        bank_transfer.from_bank_account_number_id = BankAccount.order("RAND()").first.id
        bank_transfer.to_bank_account_number_id = BankAccount.order("RAND()").first.id
        bank_transfer.transaction_number = Faker::Code.isbn
        bank_transfer.exchange_medium = exchange_medium
        bank_transfer.save!
    end
  }

  # Storage Units

  # creates a root Storage Unit to be the main parent
  StorageUnit.create!(code: 'ROOT SAMPLE', remark: Faker::Commerce.product_name, parent: nil)

  number_of_storage_units = 20
  number_of_storage_units.times {
    storage_unit = StorageUnit.new
    storage_unit.code = Faker::Code.isbn
    storage_unit.remark = Faker::Commerce.product_name
    storage_unit.parent = StorageUnit.order("RAND()").first
    storage_unit.save!
  }

end