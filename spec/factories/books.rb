FactoryBot.define do
  factory :book do
    name {FFaker::Name.name}
    page {100}
  end
end
