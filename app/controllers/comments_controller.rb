class CommentsController < ApplicationController
	before_action :set_manga
	# before_action :set_comment
	def new
		@manga.comments.new()
	end
	def create
		@comment = @manga.comments.create(comment_param.merge(user: current_user))
		respond_to do |format|
    if @comment.save
      format.js {}
      format.html { redirect_to manga_path(@manga) }
    else
      format.html { render :new }
      format.js { render 'create_error' }
    end
  end

		# 
		# redirect_to manga_path(@manga)
	end
	private
	def comment_param
		params.require(:comment).permit(:message, :user_id, :parent_id, :sub_parent_id)
	end
	def set_manga
		@manga = Manga.find(params[:manga_id])
	end
	def set_comment
		byebug
		@comment = Comment.find(params[:id])
	end
end
