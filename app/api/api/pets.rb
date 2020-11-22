# frozen_string_literal: true

class Pets < Grape::API
  format :json

  namespace :pets do
    desc 'Get list of all pets'

    get do
      Pet.all.map{ |p| PetSerializer.new(p).as_json }
    end
  end

  namespace :pet do
    desc 'Get information about pet by given id'
    params do
      requires :id, type: String, desc: 'uuid of pet'
    end

    get do
      PetSerializer.new(Pet.find(params[:id]))
    end

    desc 'Create a new pet'
    params do
      requires :name, type: String, desc: 'pet name'
      requires :age, type: Integer, desc: 'pet age'
      requires :breed, type: String, desc: 'per breed'
      requires :pet_type, type: String, desc: 'pet type'
      requires :gender, type: String, desc: 'pet gender'
      optional :description, type: String, desc: 'pet description'
    end

    post do
      pet_type = PetType.find_by(name: params[:pet_type])
      error!({ error: 'Invalid pet type' }, 400) if pet_type.blank?

      Pet.create!(
        {
          name: params[:name],
          age: params[:age],
          breed: params[:breed],
          pet_type_id: pet_type.id,
          description: params[:description],
          gender: params[:gender]
        }
      )
      status 200
    end

    desc 'Update a pet'
    params do
      requires :id, type: String, desc: 'pet uuid'
      optional :attributes, type: Hash, desc: 'attributes'
    end

    put do
      pet = Pet.find(params[:id])
      pet.update!(params[:attributes]) unless params[:attributes].blank?
      status 200
    end

    desc 'Remove a pet'
    params do
      requires :id, type: String, desc: 'pet uuid'
    end

    delete do
      pet = Pet.find(params[:id])
      pet.destroy!
      status 200
    end
  end
end