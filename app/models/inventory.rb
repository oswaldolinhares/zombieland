# frozen_string_literal: true

# Inventory
class Inventory < ApplicationRecord
  belongs_to :survivor

  validates :water, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :food, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :medication, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :ammunition, numericality: { greater_than_or_equal_to: 0, only_integer: true }
end
