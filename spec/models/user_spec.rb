require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'custom validations' do
    describe 'invited' do
      context 'when email has not been invited' do
        it 'has errors' do
          create(:invitation, email: 'mario@domain.com')
          invalid_user = build(:user, email: 'luigi@domain.com')

          invalid_user.valid?

          expect(invalid_user.errors[:email]).to eq(['must have been invited'])
        end
      end
    end
  end
end