class BorrowDetail < ApplicationRecord
  BORROW_DETAILS_PARAMS = %i(request_date_from request_date_to book_id).freeze
  belongs_to :borrow
  belongs_to :book

  delegate :name, to: :book, prefix: :book
end
