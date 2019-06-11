FactoryBot.define do
  sequence :name do |n|
    "name #{n}"
  end

  sequence :email do |n|
    "name+#{n}@example.com"
  end
end