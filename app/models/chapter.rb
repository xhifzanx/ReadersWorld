class Chapter < ApplicationRecord
  include ActiveStorage::Blob::Analyzable

  belongs_to :manga
  has_many_attached :images
  has_many :comment_chapters
  has_many :reply_chapters
end
