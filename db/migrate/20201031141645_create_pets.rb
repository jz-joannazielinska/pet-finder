# frozen_string_literal: true

class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets, id: :uuid do |t|
      t.string :name, null: false
      t.integer :age, null: false
      t.string :breed, null: false
      t.string :description
      t.string :gender, null: false

      t.timestamps
    end
  end
end
