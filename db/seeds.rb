# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts " Initializing Database with Core Data for Production and Development Environment"

# Execute only in a Development Environment; This is "fake" sample data
if Rails.env.development? || Rails.env.test?

  puts " Generating Sample Data for Development and Test Environment"

  # --------------------- Associated Constants ---------------------

  # Number of SystemAccounts
  NUMBER_OF_SYSTEM_ACCOUNTS = 50

  # Percent of System Accounts to have ContactDetails
  PERCENT_SA_WITH_CD = 25

  # Possible Range of Contact Details per System Account
  CD_PER_SA = (1..5)

  # Percent of Contact Details to have Telephones
  PERCENT_CD_WITH_TEL = 25

  # Possible Range of Telephone Numbers per Contact Details
  TEL_PER_CD = (3..5)

  # Percent of Contact Details to have Links
  PERCENT_CD_WITH_LINK = 25

  # Possible Range of Links per Contact Details
  LINK_PER_CD = (2..5)

  # Percent of Contact Details to have Locations
  PERCENT_CD_WITH_LOC = 25

  # Possible Range of Locations per Contact Details
  LOC_PER_CD = (2..5)

  # Possible Range of Locations per Contact Details
  NUMBER_OF_VEHICLES = 500


  # --------------------- Generate Sample Data ---------------------

  # Vehicles
  NUMBER_OF_VEHICLES.times {
    current_vehicle = Enterprise::GeneralManagement::Vehicle.new
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
  NUMBER_OF_SYSTEM_ACCOUNTS.times {

    current_image = ['sample_system_account_01.jpg',
                     'sample_system_account_02.jpg',
                     'sample_system_account_03.jpg',
                     'sample_system_account_04.jpg',
                     'sample_system_account_05.jpg',
                     ''].sample



    current_system_account = Enterprise::SystemAccount.create!(name: Faker::Name.name,
                                                               description: Faker::Lorem.sentence,
                                                               account_type: %w(BUSINESS INDIVIDUAL).sample)
    current_system_account[:primary_image] = current_image
    current_system_account.save!

    # System Accounts with Contact Details
    PERCENT_SA_WITH_CD.in(50) do
      rand(CD_PER_SA).times do
        current_contact_detail = Enterprise::GeneralManagement::ContactDetail.create!(
            label: %w(HOME MAIN-BRANCH SUB-BRANCH WAREHOUSE DELIVERY).sample,
            system_account: current_system_account)

        # Contact Details with Telephone Numbers
        PERCENT_CD_WITH_TEL.in(50) do
          rand(TEL_PER_CD).times do
            Enterprise::GeneralManagement::ContactDetails::TelephoneNumber.create!(contact_detail: current_contact_detail,
                                    remark: Faker::Company.name,
                                    digits: Faker::Number.number( rand(7..64)) )
          end
        end

        # Contact Details with Links
        PERCENT_CD_WITH_LINK.in(50) do
          rand(LINK_PER_CD).times do
            Enterprise::GeneralManagement::ContactDetails::Link.create!(contact_detail: current_contact_detail,
                                                                        service: %w(EMAIL SKYPE VIBER).sample,
                                                                        url: Faker::Internet.user_name,
                                                                        remark: Faker::Company.name )
          end
        end

        # Contact Details with Location
        PERCENT_CD_WITH_LOC.in(50) do
          rand(LOC_PER_CD).times do
            aggregated_address = Faker::Address.street_address + Faker::Address.city + Faker::Address.state
            Enterprise::GeneralManagement::ContactDetails::Location.create!(contact_detail: current_contact_detail,
                                                                            latitude: Faker::Address.latitude,
                                                                            longitude: Faker::Address.longitude,
                                                                            address: aggregated_address)
            end
        end
      end
    end
  }


end