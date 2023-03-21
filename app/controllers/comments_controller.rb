class CommentsController < ApplicationController
	before_action :set_manga
	before_action :set_comment
	def create
		@manga.comment.create(comment_param)
	end
	private
	def comment_param
		params.require(:comment).permit(:message, :user_id)
	end
	def set_manga
		@manga = Manga.find(params[:manga_id])
	end
	def set_comment
		@comment = Comment.find(params[:id])
	end
end
