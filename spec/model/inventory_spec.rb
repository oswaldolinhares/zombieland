# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Inventory, type: :model do
  describe 'validations' do
    it { is_expected.to validate_numericality_of(:water).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_numericality_of(:food).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_numericality_of(:medication).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_numericality_of(:ammunition).is_greater_than_or_equal_to(0) }
  end
end
