FactoryBot.define do
  factory :comment do
    content {FFaker::Name.name}
  end
end
