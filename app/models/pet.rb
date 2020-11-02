# frozen_string_literal: true

class Pet < ApplicationRecord
  belongs_to :pet_type
  has_many_attached :images

  validates_presence_of :name, :age, :breed
  validates_length_of :age, maximum: 2
end
