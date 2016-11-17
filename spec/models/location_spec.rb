RSpec.describe Location, :type => :model do

  it { should validate_presence_of(:longitude) }
  it { should validate_length_of(:longitude).is_at_least(2).is_at_most(256)}

  it { should validate_presence_of(:latitude) }
  it { should validate_length_of(:latitude).is_at_least(2).is_at_most(256)}

  it { should validate_presence_of(:address) }
  include_examples 'sentence', :address

  it { should validate_presence_of(:contact_detail) }

end

