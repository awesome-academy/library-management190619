class Book < ApplicationRecord
  belongs_to :category
  belongs_to :publisher
  belongs_to :author

  has_many :ratings, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
end
