# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Survivor, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:gender) }

    it { is_expected.to validate_numericality_of(:age).is_greater_than(0).only_integer }
    it { is_expected.to validate_numericality_of(:latitude)
        .is_greater_than_or_equal_to(-90).is_less_than_or_equal_to(90)
       }
    it { is_expected.to validate_numericality_of(:longitude)
        .is_greater_than_or_equal_to(-180).is_less_than_or_equal_to(180)
       }
  end
end
