# frozen_string_literal: true

FactoryBot.define do
    factory :pet_type do
      id { SecureRandom.uuid }
      name { Faker::Creature::Animal.name }
    end
  end