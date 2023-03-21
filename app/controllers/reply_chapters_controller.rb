class ReplyChaptersController < ApplicationController
	before_action :set_comment_chapter
	before_action :set_reply_chapter
	def create
		byebug
		@comment_chapter.reply_chapter.create(repy_comment_param)
	end
	def update
		byebug
		@reply_chapter = @comment_chapter.reply_chapter.update(repy_comment_param)
	end
	private
	def repy_comment_param
		params.require(:reply_chapter).permit(:reply_message, :user_id)
	end
	def set_comment_chapter
		@comment_chapter = CommentChapter.find(params[:comment_chapter_id])
	end
	def set_reply_chapter
		@reply_chapter = ReplyChapter.find(params[:id])
	end
end
