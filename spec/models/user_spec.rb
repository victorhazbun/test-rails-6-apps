require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.by_ci_email' do
    it 'returns users filtered by case insensitive email' do
      positive = create(:user, email: 'jhon@example.com')
      negative = create(:user, email: 'larry@example.com')

      expect(
        described_class.by_ci_email(positive.email)
      ).to include(positive)
      expect(
        described_class.by_ci_email(positive.email)
      ).to_not include(negative)
    end
  end
end