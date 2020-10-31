# frozen_string_literal: true

FactoryBot.define do
  factory :pet do
    id { SecureRandom.uuid }
    name { Faker::Creature::Cat.name }
    age { 8 }
    breed { Faker::Creature::Cat.breed }
    after(:build) do |pet|
        img_path = Rails.root.join('spec', 'support', 'assets', 'cat.jpg')
        img = fixture_file_upload(img_path, 'image/png')
        pet.images.attach(img)
    end
  end
end