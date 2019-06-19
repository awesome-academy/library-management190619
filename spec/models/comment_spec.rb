require "rails_helper"

RSpec.describe Comment do
  let(:user_1) {FactoryBot.create :user}
  let(:author_1) {FactoryBot.create :author}
  let(:category_1) {FactoryBot.create :category}
  let(:publisher_1) {FactoryBot.create :publisher}
  let (:book_1) {FactoryBot.create :book, author_id: author_1.id, category_id: category_1.id, publisher_id: publisher_1.id}
  subject {FactoryBot.build :comment, user_id: user_1.id, book_id: book_1.id}
  it {is_expected.to be_valid}


  context "columns" do
    it {is_expected.to have_db_column(:content).of_type(:string)}
    it {is_expected.to have_db_column(:user_id).of_type(:integer)}
    it {is_expected.to have_db_column(:book_id).of_type(:integer)}
  end

  context "content" do
    it {is_expected.to validate_presence_of(:content)}
    it {is_expected.to validate_length_of(:content)}
  end

  context "associations" do
    it {is_expected.to belong_to(:user)}
    it {is_expected.to belong_to(:book)}
  end

end
