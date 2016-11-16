RSpec.describe Vehicle, type: :model do

  it { should validate_presence_of(:system_account) }
  it { should validate_length_of(:label).is_at_least(2).is_at_most(64) }

end
