FactoryBot.define do
  factory :ticket do
    subject { "Can't book a lesson" }
    body { "I tried to book Saturday at 10 and it says no slots." }
    sequence(:customer_email) { |n| "customer#{n}@example.com" }
  end
end
