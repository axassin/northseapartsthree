FactoryGirl.define do

  factory :vehicle do
    color 'Blue'
    make 'Sedan'
    brand 'Toyota'
    sequence(:plate_number) { |n| "NMQ-#{n}"}
    fuel_type 'diesel'
    date_of_registration DateTime.new(2001,2,3,4,5,6)
    primary_image 'sample_vehicle_01.png'
  end

end