# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
                                remark: Faker::Company.name,
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

  }

  # Employees
  NO_OF_EMPLOYEES = 30
  employee_associated_system_accounts = SystemAccount.where(account_type: 'INDIVIDUAL').order("RAND()").limit(NO_OF_EMPLOYEES)
  employee_associated_system_accounts.each do |system_account|
    current_employee = Employee.create!(system_account: system_account)
    current_employee.save

    50.in(100) do
      current_biodata = Biodatum.create!(
          system_account_id: current_employee.system_account.id,
          name_of_mother: Faker::Name.name,
          name_of_father: Faker::Name.name,
          dependents: Faker::Lorem.sentence(10),
          complexion: %w(light medium dark eurasia).sample,
          height: %w(5'7" 32cm 3234cm 5m 3cm).sample,
          sex: %w(MALE FEMALE).sample,
          blood_type: %w(O A B AB).sample,
          education: Faker::Lorem.sentence(10),
          experience: Faker::Lorem.sentence(10),
          notable_accomplishment: Faker::Lorem.sentence(10),
          description: Faker::Lorem.sentence(10),
          date_of_birth: 
      )
      current_biodata.save
    end

  end



end