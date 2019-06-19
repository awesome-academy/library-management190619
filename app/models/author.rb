class Author < ApplicationRecord
  has_many :books
  has_many :followings, dependent: :destroy
end
