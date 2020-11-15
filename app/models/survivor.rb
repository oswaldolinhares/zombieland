# frozen_string_literal: true

# Survivor
class Survivor < ApplicationRecord
  has_one :inventory

  enum gender: { male: 'male', female: 'female' }

  validates :name, presence: true
  validates :age, numericality: { greater_than: 0, only_integer: true }
  validates :gender, presence: true
  validates :latitude, numericality:
                        {
                          greater_than_or_equal_to: -90,
                          less_than_or_equal_to: 90
                        }
  validates :longitude, numericality:
                        {
                          greater_than_or_equal_to: -180,
                          less_than_or_equal_to: 180
                        }
end
