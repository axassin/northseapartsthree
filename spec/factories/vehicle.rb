FactoryGirl.define do

  factory :vehicle do
    color {Faker::Color.color_name}
    make {%w(TRUCK PICKUP VAN SEDAN).sample}
    brand  {Faker::Company.name}
    sequence(:plate_number) { |n| + "#{ Faker::Lorem.characters(6) }" + "#{n}" }
    fuel_type {%w(DIESEL GASOLINE).sample}
    date_of_registration {Faker::Time.between(DateTime.now - 3600, DateTime.now)}
    primary_image {['sample_vehicle_01.jpg',
                   'sample_vehicle_02.png',
                   'sample_vehicle_03.jpg',
                   'sample_vehicle_04.png',
                   'sample_vehicle_05.jpg',
                   ''].sample}
  end

end