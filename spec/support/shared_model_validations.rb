RSpec.shared_examples 'word' do |parameter|
  it { should validate_length_of(parameter).is_at_least(2).is_at_most(64)}
end

RSpec.shared_examples 'sentence' do |parameter|
  it { should validate_length_of(parameter).is_at_least(2).is_at_most(256)}
end

RSpec.shared_examples 'paragraph' do |parameter|
  it { should validate_length_of(parameter).is_at_least(2).is_at_most(512)}
end