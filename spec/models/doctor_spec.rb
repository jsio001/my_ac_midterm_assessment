require 'rails_helper'

RSpec.describe Doctor, type: :model do

  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_presence_of(:address) }
  it { is_expected.to validate_presence_of(:gender) }

  describe 'validates uniqueness of' do
    subject { Doctor.create(username: 'abc@email.com', address: '123 abc', gender: 'female') }

    it { is_expected.to validate_uniqueness_of(:username).case_insensitive }
  end

end
