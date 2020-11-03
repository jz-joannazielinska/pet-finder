# frozen_string_literal: true

class Pet < ApplicationRecord

  has_many_attached :images

  belongs_to :pet_type

  validates_presence_of :name, :age, :breed, :description
  validates_length_of :age, maximum: 2
end
