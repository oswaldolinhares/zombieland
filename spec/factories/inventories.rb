# frozen_string_literal: true

FactoryBot.define do
  factory :inventory do
    survivor
    water { Faker::Number.within(range: 1..10) }
    food { Faker::Number.within(range: 1..10) }
    medication { Faker::Number.within(range: 1..10) }
    ammunition { Faker::Number.within(range: 1..10) }
  end
end
