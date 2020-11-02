# frozen_string_literal: true

describe PetType, type: :model do
  describe 'validations' do
    subject { create(:pet_type) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
