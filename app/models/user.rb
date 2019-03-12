class User < ApplicationRecord
  validates :email, invited: true
end
