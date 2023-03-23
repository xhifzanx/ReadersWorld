class CommentChaptersController < ApplicationController
	before_action :set_chapter
	before_action :set_comment_chapter, only: %i[show edit update destroy]
	def new
		@comment_chapter = @chapter.comment_chapter.new(comm)
	end
	def create
		byebug
		@comment_chapter = @chapter.comment_chapters.create(comment_chapter_param.merge(user: current_user))
	end
	private
	def comment_chapter_param
		params.require(:comment_chapter).permit(:message, :user_id, :parent_id)
	end
	def set_chapter
		@chapter = Chapter.find(params[:chapter_id])
	end
	def set_comment_chapter
		byebug
		@comment_chapter = CommentChapter.find(params[:id])
	end
end
