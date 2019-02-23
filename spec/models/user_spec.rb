require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.by_ci_email' do
    it 'returns users filtered by case insensitive email' do
      user_a = create(:user, email: 'JHON@example.com')
      user_b = create(:user, email: 'Larry@example.com')

      expect(
        described_class.by_ci_email(user_a.email)
      ).to include(user_a)

      expect(
        described_class.by_ci_email(user_a.email)
      ).to_not include(user_b)
    end
  end
end