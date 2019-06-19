require "rails_helper"

RSpec.describe Book do
  let(:author_1) {FactoryBot.create :author}
  let(:category_1) {FactoryBot.create :category}
  let(:publisher_1) {FactoryBot.create :publisher}
  subject {FactoryBot.build :book, author_id: author_1.id, category_id: category_1.id, publisher_id: publisher_1.id}

  it {is_expected.to be_valid}

  context "columns" do
    it {is_expected.to have_db_column(:name).of_type(:string)}
    it {is_expected.to have_db_column(:author_id).of_type(:integer)}
    it {is_expected.to have_db_column(:category_id).of_type(:integer)}
    it {is_expected.to have_db_column(:publisher_id).of_type(:integer)}
  end

  context "associations" do
    it {is_expected.to belong_to(:author)}
    it {is_expected.to belong_to(:category)}
    it {is_expected.to belong_to(:publisher)}
    it {is_expected.to have_many(:comments).with_foreign_key(:book_id)}
    it {is_expected.to have_many(:likes).with_foreign_key(:book_id)}
    it {is_expected.to have_many(:ratings).with_foreign_key(:book_id)}
    it {is_expected.to have_many(:borrow_details).with_foreign_key(:book_id)}
    it {is_expected.to have_many(:followings).with_foreign_key(:book_id)}
  end

  describe "#get_average_rating" do
    let!(:book_1) {FactoryBot.create :book, author_id: author_1.id, category_id: category_1.id, publisher_id: publisher_1.id}
    let!(:rating_1) {FactoryBot.create :rating, user_id: user_1.id, book_id: book_1.id}
    let!(:rating_2) {FactoryBot.create :rating, rating: 6.0, user_id: user_1.id, book_id: book_1.id}
    it {expect(book_1.get_average_rating ).to eql(5.5)}
  end
end
