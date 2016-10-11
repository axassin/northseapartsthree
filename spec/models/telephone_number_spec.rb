RSpec.describe TelephoneNumber, :type => :model do
  it { should validate_presence_of(:digits) }
  it { should validate_length_of(:digits).is_at_least(5).is_at_most(64)}
  it { should validate_presence_of(:contact_detail) }
end