class CommentChapter < ApplicationRecord
  belongs_to :chapter
  belongs_to :user
  has_many :reply_chapters
end
