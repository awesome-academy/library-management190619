class Following < ApplicationRecord
  belongs_to :user
  belongs_to :author
  belongs_to :book
end
