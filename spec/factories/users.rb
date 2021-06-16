FactoryBot.define do
  factory :user, class: User do
    username { 'testuser' }
    sequence(:email) { |n| "TEST#{n}@example.com" }
    password { 'testpassword' }
    password_confirmation { 'testpassword' }
    after(:create) { |user| user.confirm }
  end
end
