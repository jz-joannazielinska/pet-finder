# frozen_string_literal: true

describe 'pets' do
  let(:response_body) { JSON.parse(response.body) }

  describe 'get /api/pets' do
    let(:api_call) { get '/api/pets' }

    context 'when there are no pets' do
      it 'returns empty json' do
        api_call
        expect(response_body).to eq([])
      end
    end

    context 'when there are some pets' do
      let!(:pets) { create_list(:pet, 2) }
      let(:expected_result) do
        [
          {
            id: pets[0][:id],
            name: pets[0][:name],
            age: pets[0][:age],
            breed: pets[0][:breed],
            pet_type: pets[0].pet_type.name
          },
          {
            id: pets[1][:id],
            name: pets[1][:name],
            age: pets[1][:age],
            breed: pets[1][:breed],
            pet_type: pets[1].pet_type.name

          }
        ].as_json
      end
      it 'returns list of pets' do
        api_call
        expect(response_body).to eq(expected_result)
      end
    end
  end

  describe 'get /api/pet' do
    let(:api_call) { get '/api/pet', params: params }

    describe 'failure' do
      context 'when id param is missing' do
        let(:params) { {} }

        it_behaves_like 'returns http status', status: 400
        it_behaves_like 'returns error msg', msg: 'id is missing'
      end

      context 'when pet by given id does not exist' do
        let(:params) { { id: SecureRandom.uuid } }

        it_behaves_like 'returns http status', status: 400
        it_behaves_like 'returns error msg', msg: 'Record not found'
      end
    end

    describe 'success' do
      let(:pet) { create(:pet) }
      let(:params) { { id: pet.id } }
      let(:expected_result) do
        {
          id: pet.id,
          name: pet.name,
          age: pet.age,
          breed: pet.breed,
          pet_type: pet.pet_type.name
        }.as_json
      end

      it 'returns a pet' do
        api_call
        expect(response_body).to eq(expected_result)
      end
    end
  end

  describe 'post /api/pet' do
    let(:api_call) { post '/api/pet', params: params }

    describe 'failure' do
      context 'when params are missing' do
        let(:params) { {} }

        it_behaves_like 'returns http status', status: 400
        it_behaves_like 'returns error msg',
          msg: 'name is missing, age is missing, breed is missing, pet_type is missing'
      end
    end

    describe 'success' do
      let!(:pet_type) { create(:pet_type) }
      let(:params) { { name: 'leo', age: 6, breed: 'bengal', pet_type: pet_type.name } }

      it_behaves_like 'returns http status', status: 200

      it 'creates a new record' do
        expect{ api_call }.to change{ Pet.count }.by(1)
      end
    end
  end

  describe 'put /api/pet' do
    let(:api_call) { put '/api/pet', params: params }

    describe 'failure' do
      context 'when id param is missing' do
        let(:params) { {} }

        it_behaves_like 'returns http status', status: 400
        it_behaves_like 'returns error msg', msg: 'id is missing'
      end

      context 'when pet by given id does not exist' do
        let(:params) { { id: SecureRandom.uuid } }

        it_behaves_like 'returns http status', status: 400
        it_behaves_like 'returns error msg', msg: 'Record not found'
      end
    end

    describe 'success' do
      let(:pet) { create(:pet) }

      context 'when attributes are empty' do
        let(:params) { { id: pet.id, attributes: {} } }

        it_behaves_like 'returns http status', status: 200
      end

      context 'when attributes are not empty' do
        let(:params) { { id: pet.id, attributes: { name: 'elo' } } }

        it_behaves_like 'returns http status', status: 200

        it 'updates pet attribute' do
          api_call
          expect(pet.reload.name).to eq('elo')
        end
      end
    end
  end

  describe 'delete /api/pet' do
    let(:api_call) { delete '/api/pet', params: params }

    describe 'failure' do
      context 'when id param is missing' do
        let(:params) { {} }

        it_behaves_like 'returns http status', status: 400
        it_behaves_like 'returns error msg', msg: 'id is missing'
      end

      context 'when pet by given id does not exist' do
        let(:params) { { id: SecureRandom.uuid } }

        it_behaves_like 'returns http status', status: 400
        it_behaves_like 'returns error msg', msg: 'Record not found'
      end
    end

    describe 'success' do
      let!(:pet) { create(:pet) }
      let(:params) { { id: pet.id } }

      it_behaves_like 'returns http status', status: 200

      it 'removes a record' do
        expect { api_call }.to change{ Pet.count }.by(-1)
      end
    end
  end
end
