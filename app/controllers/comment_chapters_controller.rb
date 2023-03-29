class CommentChaptersController < ApplicationController
	before_action :set_chapter
	before_action :set_comment_chapter, only: %i[show edit update destroy]
	def new
		@comment_chapter = @chapter.comment_chapter.new()
	end
	def create
		
		@comment_chapter = @chapter.comment_chapters.create(comment_chapter_param.merge(user: current_user))
		respond_to do |format|
		    if @comment_chapter.save
		      format.js {}
		      format.html { redirect_to manga_chapter_path(@chapter.manga, @chapter) }
		    else
		      format.html { render :new }
		      format.js { render 'create_error' }
		    end
		end
	end
	private
	def comment_chapter_param
		params.require(:comment_chapter).permit(:message, :user_id, :parent_id, :sub_parent_id)
	end
	def set_chapter
		@chapter = Chapter.find(params[:chapter_id])
	end
	def set_comment_chapter
		byebug
		@comment_chapter = CommentChapter.find(params[:id])
	end
end
