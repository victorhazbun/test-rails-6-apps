FactoryBot.define do
  factory :invitation do
    invited_email { generate(:email) }
    invited_name { generate(:name) }
    sent_at { Time.current }
    accepted_at { 1.day.from_now }
    expiration_at { 2.days.from_now }
  end
end
