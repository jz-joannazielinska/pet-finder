# frozen_string_literal: true

class PetType < ApplicationRecord
  has_many :pets
  validates_presence_of :name
  validates_uniqueness_of :name
end
