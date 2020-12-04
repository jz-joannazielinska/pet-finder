# frozen_string_literal: true

require 'factory_bot_rails'

# Generate Pets
pet_types = ['cat', 'dog']
pet_types.each { |type| PetType.find_or_create_by(name: type) }
pet_types_id = PetType.all.collect(&:id)

FactoryBot.create_list(:pet, 10, pet_type_id: pet_types_id.sample)


# Generate Tags
tags = %w(active peaceful lazy joyful playful like_other_animals doesnt_like_other_animals like_cats lik_dogs like_kids doesnt_like_kids couch_potato)
tags.each do |tag|
  ActsAsTaggableOn::Tag.new(:name => tag).save
end
