class Invitation < ApplicationRecord
  def expired?
    expiration_at > Time.current.end_of_day
  end
end
