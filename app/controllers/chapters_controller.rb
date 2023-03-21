class ChaptersController < ApplicationController
	
	before_action :set_manga
	before_action :set_chapter, only: %i[show edit update destroy]
	def index
		byebug
		@chapters = @manga.chapters

	end
	def new
		@chapter = @manga.chapters.build
	end
	def create
		@chapter = @manga.chapters.build(images: params[:chapter][:images])
		if @chapter.save
			flash[:success] = 'Chapter uploaded successfully'
		else
			flash[:danger] = 'Failed to uploaded chapter'
		end
	end

	def show
		@chapter.update(is_seen: true)
		@comment_chapter = @chapter.comment_chapters.build
		@reply_chapter = @chapter.comment_chapters.each { |comment_chapter| comment_chapter.reply_chapters.build}
		
	end
	def edit
	end
	def update
		byebug
		@chapter.update(images: chapter_param[:images]) if chapter_param[:images].present?
		@chapter.update(title: chapter_param[:title]) if chapter_param[:title].present?
	end
	def destroy
		@chapter.destroy
	end
	private
	def chapter_param
		params.require(:chapter).permit(:title, :manga_id, images:[])
	end
	def set_manga
		@manga = Manga.find(params[:manga_id])
	end
	def set_chapter
		@chapter = @manga.chapters.find(params[:id])
	end
end
