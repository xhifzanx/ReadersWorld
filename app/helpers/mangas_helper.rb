module MangasHelper
	def sorted_mangas(ids)
		@result = []
		ids.split("/").each do |id|
			@result.push(Manga.find(id))
		end
		return @result
	end
end
