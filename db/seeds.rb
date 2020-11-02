# frozen_string_literal: true

require 'factory_bot_rails'

pet_types = ['cat', 'dog']
pet_types.each { |type| PetType.find_or_create_by(name: type) }
pet_types_id = PetType.all.collect(&:id)

10.times do
  FactoryBot.create(:pet, pet_type_id: pet_types_id.sample)
end