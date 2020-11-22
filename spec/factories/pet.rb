# frozen_string_literal: true

FactoryBot.define do
  factory :pet do
    id { SecureRandom.uuid }
    name { Faker::Creature::Cat.name }
    age { 8 }
    breed { Faker::Creature::Cat.breed }
    pet_type_id { create(:pet_type).id }
    description { 'some kind of cat' }
    gender { Faker::Gender.binary_type }
  end
end