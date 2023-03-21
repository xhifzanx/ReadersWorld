class ReplyChapter < ApplicationRecord
  belongs_to :comment_chapter
  belongs_to :user
  belongs_to :chapter
end
