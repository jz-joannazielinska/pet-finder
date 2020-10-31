# frozen_string_literal: true

describe Pet, type: :model do
  describe 'validations' do
      subject { create(:pet) }

      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:age) }
      it { is_expected.to validate_presence_of(:breed) }
      it { is_expected.to validate_length_of(:age) }
  end
end