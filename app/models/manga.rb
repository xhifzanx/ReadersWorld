class Manga < ApplicationRecord

	has_many :chapters
	has_one_attached :thumbnail
	has_and_belongs_to_many :users
	has_many :comments

	has_rich_text :description

	serialize :categories, Array
	enum status: {
		in_progress: 0,
		completed: 1,
		dropped: 2
	}

	def color(status)
		case(status)
			when "in_progress"
				'primary'
			when 'completed'
				'success'
			when 'dropped'
				'danger'
		end
	end

	def add_bookmark(manga)
		manga.update(bookmarked: true)
	end

	def remove_bookmark(manga)
		manga.update(bookmarked: false)
	end

end
