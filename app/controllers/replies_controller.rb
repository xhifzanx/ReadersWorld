class RepliesController < ApplicationController
	before_action :set_comment
	before_action :set_reply
	def create
		byebug
		@comment.reply.create(reply_param)
	end
	private
	def reply_param
		params.require(:reply).permit(:reply_message, :user_id)
	end
	def set_comment
		@comment = Comment.find(params[:comment_id])
	end
	def set_reply
		@reply = Reply.find(params[:id])
	end
end
