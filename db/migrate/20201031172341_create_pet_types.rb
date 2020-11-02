# frozen_string_literal: true

class CreatePetTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :pet_types, id: :uuid do |t|
      t.string :name, null: false, uniq: true
      t.timestamps
    end

    add_reference :pets, :pet_type, type: :uuid, index: true, foreign_key: true
  end
end
