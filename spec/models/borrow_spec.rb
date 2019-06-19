require "rails_helper"

RSpec.describe Borrow do
  let(:user_1) {FactoryBot.create :user}
  subject {FactoryBot.build :borrow, user_id: user_1.id}
  it {is_expected.to be_valid}

  context "columns" do
    it {is_expected.to have_db_column(:user_id).of_type(:integer)}
  end

  context "associations" do
    it {is_expected.to belong_to(:user)}
    it {is_expected.to have_many(:borrow_details).with_foreign_key(:borrow_id)}
  end

end
