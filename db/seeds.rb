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

    current_file = ['sample_image_01.jpg',
                    'sample_image_02.jpg',
                    'sample_image_03.jpg',
                    'sample_image_04.jpg',
                    'sample_image_05.jpg',
                    ''].sample

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

  # --------------------- Generate Sample Data ---------------------

  # Branches
  NO_OF_BRANCHES = 17
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
  }

  # System Accounts
  NO_OF_SYSTEM_ACCOUNTS = 70
  NO_OF_SYSTEM_ACCOUNTS.times {

    current_image = ['sample_system_account_01.jpg',
                     'sample_system_account_02.jpg',
                     'sample_system_account_03.jpg',
                     'sample_system_account_04.jpg',
                     'sample_system_account_05.jpg',
                     ''].sample

    current_name = [Faker::Company.name,Faker::Name.name ].sample

    current_system_account = SystemAccount.create!(name: current_name,
                                                   description: Faker::Lorem.sentence,
                                                   account_type: %w(BUSINESS INDIVIDUAL).sample)

    current_system_account[:primary_image] = current_image
    current_system_account.save!
    establish_contact_details(SystemAccount, current_system_account.id)
    establish_image(SystemAccount, current_system_account.id)
  }

  # Employees
  NO_OF_EMPLOYEES = 30
  employee_associated_system_accounts = SystemAccount.where(account_type: 'INDIVIDUAL').order("RAND()").limit(NO_OF_EMPLOYEES)
  employee_associated_system_accounts.each do |system_account|
    current_employee = Employee.create!(system_account: system_account,
                                        branch: Branch.offset(rand(Branch.count)).first,
                                        position: Faker::Lorem.sentence(1))

    current_employee.save
    establish_file(Employee, current_employee.id)

    # Rest Day for Employee
    rand(1..3).times do
      RestDay.create!(implemented_at: Faker::Time.between(DateTime.now - 3600, DateTime.now),
                      employee: current_employee,
                      remark: Faker::Lorem.sentence(3, false, 0),
                      day: %w(MONDAY TUESDAY WEDNESDAY THURSDAY FRIDAY SATURDAY SUNDAY).sample)
    end

    # Regular Work Period
    rand(1..3).times do

      # Regular
      generated_time_in = '08:00'
      generated_time_out = '17:00'
      one_hour_break = true
      overnight = false

      # Regular with Lunch Break
      30.in(100) do
        start_time = DateTime.new(2002, 10, 31, 0, 0, 1)
        end_time = DateTime.new(2002, 10, 31, 15, 59, 59)
        base_time = Faker::Time.between(start_time, end_time, :morning)
        generated_time_in = base_time.strftime('%H:%M')
        generated_time_out = (base_time + 9.hours).strftime('%H:%M')
        one_hour_break = true
      end

      # Regular with no Lunch Break
      30.in(100) do
        start_time = DateTime.new(2002, 10, 31, 0, 0, 1)
        end_time = DateTime.new(2002, 10, 31, 15, 59, 59)
        base_time = Faker::Time.between(start_time, end_time, :morning)
        generated_time_in = base_time.strftime('%H:%M')
        generated_time_out = (base_time + 8.hours).strftime('%H:%M')
        one_hour_break = false
      end

      # Overnight
      30.in(100) do
        start_time = DateTime.new(2002, 10, 31, 2, 0, 1)
        end_time = DateTime.new(2002, 10, 31, 15, 59, 59)
        base_time = Faker::Time.between(start_time, end_time, :morning)
        generated_time_in = base_time.strftime('%H:%M')
        generated_time_out = (base_time + 8.hours).strftime('%H:%M')
        one_hour_break = true
      end

      # Overnight with no Lunch Break


      RegularWorkPeriod.create!(implemented_at: Faker::Time.between(DateTime.now - 3600, DateTime.now),
                                employee: current_employee,
                                remark: Faker::Lorem.sentence(3, false, 0),
                                time_in: generated_time_in,
                                time_out: generated_time_out,
                                one_hour_break: one_hour_break,
                                overnight: overnight)
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
          implemented_at: Faker::Date.between(6.years.ago, 1.years.ago),
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
      exact_time_out_second_half = Time.new(generated_year, generated_month, generated_day, 18, 0 ,0)

      time_in = [generated_time_in, exact_time_in_first_half, exact_time_in_second_half].sample
      time_out = [generated_time_out, exact_time_out_first_half, exact_time_out_second_half].sample

      5.in(10) do
        time_in = Time.new(generated_year, generated_month, generated_day, 8, 0 ,0)
        time_out = Time.new(generated_year, generated_month, generated_day, 12, 0 ,0)
      end

      5.in(10) do
        time_in = Time.new(generated_year, generated_month, generated_day, 13, 0 ,0)
        time_out = Time.new(generated_year, generated_month, generated_day, 18, 0 ,0)
      end

      # Time Precedence
      while time_in.to_i >= time_out.to_i
        time_out = Faker::Time.between(earliest_time_in, latest_time_out, :all)
      end

      # Time Overlap
      save_flag = true
      implemented_at_time_in = DateTime.new(generated_year, generated_month, generated_day, time_in.hour, time_in.min, time_in.sec )
      implemented_at_time_out = DateTime.new(generated_year, generated_month, generated_day, time_out.hour, time_out.min, time_out.sec )
      AttendanceRecord.all.where(employee_id: current_employee.id).each do |att_rec|
        other_date_time_in = DateTime.new(att_rec.implemented_at.year, att_rec.implemented_at.month, att_rec.implemented_at.day, att_rec.time_in.hour, att_rec.time_in.min, att_rec.time_in.sec )
        other_date_time_out = DateTime.new(att_rec.implemented_at.year, att_rec.implemented_at.month, att_rec.implemented_at.day, att_rec.time_out.hour, att_rec.time_out.min, att_rec.time_out.sec )
        assessment = (((implemented_at_time_in..implemented_at_time_out).overlaps?(other_date_time_in..other_date_time_out)) && ( current_employee.id != att_rec.id))
        if assessment
          save_flag = false
          break;
        end
      end

      if save_flag
        AttendanceRecord.create!(
            employee_id: current_employee.id,
            remark: Faker::Lorem.sentence(3, false, 0),
            implemented_at: generated_date,
            time_in: time_in,
            time_out: time_out
        )
      end

    end

  end



end