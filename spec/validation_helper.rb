module ValidationHelper
  extend ActiveSupport::Concern

  def validate_word(att_name)
    it { should validate_length_of(att_name).is_at_least(2).is_at_most(64) }
  end

  def validate_sentence(att_name)
    it { should validate_length_of(att_name).is_at_least(2).is_at_most(256) }
  end

  def validate_paragraph(att_name)
    it { should validate_length_of(att_name).is_at_least(2).is_at_most(512) }
  end

end