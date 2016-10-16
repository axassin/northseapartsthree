RSpec.describe Link, :type => :model do

  it { should validate_presence_of(:service) }
  it { should validate_length_of(:service).is_at_least(2).is_at_most(64) }
  it { should validate_presence_of(:url) }
  it { should validate_length_of(:url).is_at_least(2).is_at_most(512) }
  it { should validate_presence_of(:contact_detail) }

  it { should validate_length_of(:remark).is_at_least(2).is_at_most(64) }
end