class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :author

  validates :content, presence: true, length: {maximum: Settings.maximum_comment_content}
end
