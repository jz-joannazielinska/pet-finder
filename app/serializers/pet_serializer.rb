# frozen_string_literal: true

class PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :breed, :pet_type

  def pet_type
    object.pet_type.name
  end
end
