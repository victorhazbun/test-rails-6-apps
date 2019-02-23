class User < ApplicationRecord
  scope :by_ci_email, -> (email) {
    where('lower(email) = lower(?)', email)
  }
end
