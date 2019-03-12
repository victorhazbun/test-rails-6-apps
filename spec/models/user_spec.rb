require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    describe 'presence' do
      context 'when name it\'s blank' do
        it 'has errors' do
          invalid_user = build(:user, name: '')

          invalid_user.valid?

          expect(invalid_user.errors[:name]).to eq(['can\'t be blank'])
        end
      end
    end
  end
end