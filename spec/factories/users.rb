FactoryBot.define do
  factory :user do
    email {FFaker::Internet.free_email}
    password {"something"}
    password_confirmation {"something"}
    is_admin {false}
  end
end
