RSpec.describe SystemAccount, :type => :model do

  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_least(2).is_at_most(64)}
  it { should validate_presence_of(:account_type) }
  it { should validate_inclusion_of(:account_type).in_array(%w[INDIVIDUAL BUSINESS]) }
  it { should validate_length_of(:description).is_at_least(2).is_at_most(512)}

end