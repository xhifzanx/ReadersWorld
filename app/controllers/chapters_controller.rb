class ChaptersController < ApplicationController
	before_action :set_manga
	before_action :set_chapter, only: %i[show edit update destroy seen]
	# load_and_authorize_resource
	
	def index
		@chapters = @manga.chapters
	end

	def new
		@chapter = @manga.chapters.build
	end

	def create
		@chapter = @manga.chapters.create(chapter_param)
		attach_chapter_images
		if @chapter.save
			flash[:success] = 'Chapter uploaded successfully'
			redirect_to manga_path(@manga)
		else
			flash[:danger] = 'Failed to uploaded chapter'
			redirect_to :new
		end
	end

	def show
		seen?
		@comment_chapter = @chapter.comment_chapters.build
	end

	def edit
	end

	def update
		attach_chapter_images
		if  @manga.chapters.update(chapter_param)
			flash[:success] = 'Chapter uploaded successfully'
			redirect_to manga_path(@manga)
		else
			flash[:danger] = 'Failed to uploaded chapter'
			redirect_to :edit
		end
	end

	def destroy
		if @chapter.destroy
			flash[:danger] = 'Chapter deleted'
		end
	end

	def seen?
		return unless current_user.present?
		return if @chapter.seen.include?(current_user.email)
		@chapter.update(seen: @chapter.seen.push(current_user.email))
	end

	private

	def chapter_param
		params.require(:chapter).permit(:title, :manga_id, seen:[])
	end

	def set_manga
		@manga = Manga.find(params[:manga_id])
	end	

	def set_chapter
		@chapter = @manga.chapters.find(params[:id])
	end

	def attach_chapter_images
		if @chapter.present? && @chapter.images.present?
			@chapter.images.destroy_all
		end
		if params[:chapter][:images].present?
      params[:chapter][:images].each do |key, image|
        @chapter.images.attach(image)
      end
    end
	end

end