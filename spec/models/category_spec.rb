require "rails_helper"

RSpec.describe Category do
  subject {FactoryBot.build :category}
  it {is_expected.to be_valid}

  context "columns" do
    it {is_expected.to have_db_column(:name).of_type(:string)}
  end

  context "name" do
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_length_of(:name)}
  end

  context "associations" do
    it {is_expected.to have_many(:books).with_foreign_key(:category_id)}
    it {is_expected.to have_many(:categories).with_foreign_key(:category_id)}
  end
end
