FactoryBot.define do
  factory :author do
    name {FFaker::Name.name}
    gender {"Male"}
  end
end
