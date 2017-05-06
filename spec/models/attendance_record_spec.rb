require 'rails_helper'

RSpec.describe AttendanceRecord, type: :model do

  describe AttendanceRecord do
    # dependency injection
    # record is stateless, no need
    it {
      is_expected.not_to validate_inclusion_of(AssociatedEmployee)
      is_expected.not_to validate_inclusion_of(TimePrecedence)
      is_expected.not_to validate_inclusion_of(TimeOverlap)
      is_expected.not_to validate_inclusion_of(ImplementedOn)
    }

  end
end
