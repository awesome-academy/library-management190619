require "rails_helper"

RSpec.describe BorrowDetail do
  let(:author_1) {FactoryBot.create :author}
  let(:category_1) {FactoryBot.create :category}
  let(:publisher_1) {FactoryBot.create :publisher}
  let (:book_1) {FactoryBot.create :book, author_id: author_1.id, category_id: category_1.id, publisher_id: publisher_1.id}
  let(:borrow_1) {FactoryBot.create :borrow, user_id: user_1.id}
  subject {FactoryBot.build :borrow_detail, book_id: book_1.id, borrow_id: borrow_1.id}
  it {is_expected.to be_valid}

  context "columns" do
    it {is_expected.to have_db_column(:book_id).of_type(:integer)}
    it {is_expected.to have_db_column(:borrow_id).of_type(:integer)}
  end

  context "associations" do
    it {is_expected.to belong_to(:book)}
    it {is_expected.to belong_to(:borrow)}
  end

end
