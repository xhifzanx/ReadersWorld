class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :manga
  has_many :replies
end
