# frozen_string_literal: true

class Pet < ApplicationRecord

  has_many_attached :images
  acts_as_taggable_on :tags

  belongs_to :pet_type

  validates_presence_of :name, :age, :breed, :description
  validates_length_of :age, maximum: 2
  validates :gender, presence: true, inclusion: %w(Male Female)
end
