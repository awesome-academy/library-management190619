FactoryBot.define do
  factory :category do
    name {FFaker::Book.genres}
  end
end
