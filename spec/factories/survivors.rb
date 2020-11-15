# frozen_string_literal: true

FactoryBot.define do
  factory :survivor do
    name { Faker::Name.unique.first_name  }
    age { Faker::Number.within(range: 1..80) }
    gender { Survivor.genders.keys.sample  }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
  end
end
