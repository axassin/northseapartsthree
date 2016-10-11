# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts " Initializing Database with Core Data for Production and Development Environment"

# Execute only in a Development Environment; This is "fake" sample data
if Rails.env.development?

  puts " Generating Sample Data for Development Environment"

  # --------------------- Associated Constants ---------------------

  # Number of SystemAccounts
  NUMBER_OF_SYSTEM_ACCOUNTS = 100

  # Percent of System Accounts to have ContactDetails
  PERCENT_SA_WITH_CD = 75

  # Possible Range of Contact Details per System Account
  CD_PER_SA = (1..5)

  # Percent of Contact Details to have Telephones
  PERCENT_CD_WITH_TEL = 75

  # Possible Range of Telephone Numbers per Contact Details
  TEL_PER_CD = (1..5)

  # Percent of Contact Details to have Links
  PERCENT_CD_WITH_LINK = 75

  # Possible Range of Links per Contact Details
  LINK_PER_CD = (1..5)

  # Percent of Contact Details to have Locations
  PERCENT_CD_WITH_LOC = 75

  # Possible Range of Locations per Contact Details
  LOC_PER_CD = (1..5)

  # --------------------- Generate Sample Data ---------------------

  # System Accounts
  NUMBER_OF_SYSTEM_ACCOUNTS.times {
    current_system_account = SystemAccount.create!(name: Faker::Name.name,
                                                  description: Faker::Lorem.sentence,
                                                  account_type: %w(BUSINESS INDIVIDUAL).sample,
                                                  primary_image: 'default.png')

    # System Accounts with Contact Details
    PERCENT_SA_WITH_CD.in(100) do
      rand(CD_PER_SA).times do
        current_contact_detail = ContactDetail.create!(label: Faker::Hipster.word,
                                                       system_account: current_system_account)

        # Contact Details with Telephone Numbers
        PERCENT_CD_WITH_TEL.in(100) do
          rand(TEL_PER_CD).times do
            TelephoneNumber.create!(contact_detail: current_contact_detail,
                                    digits: Faker::Number.number( rand(7..64)) )
          end
        end

        # Contact Details with Links
        PERCENT_CD_WITH_LINK.in(100) do
          rand(LINK_PER_CD).times do
            Link.create!(contact_detail: current_contact_detail,
                         service: %w(EMAIL SKYPE VIBER).sample,
                         url: Faker::Internet.user_name )
          end
        end

        # Contact Details with Location
        PERCENT_CD_WITH_LOC.in(100) do
          rand(LOC_PER_CD).times do
            aggregated_address = Faker::Address.street_address + Faker::Address.city + Faker::Address.state
            Location.create!(contact_detail: current_contact_detail,
                             latitude: Faker::Address.latitude,
                             longitude: Faker::Address.longitude,
                             address: aggregated_address)
            end
        end
      end
    end
  }


end