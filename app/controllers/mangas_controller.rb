class MangasController < ApplicationController
	load_and_authorize_resource :manga, :class => "Manga"
	before_action :set_manga, only: %i[show edit update destroy bookmark_action]
	def index
		@mangas = Manga.all
	end

	def new
		@manga = Manga.new
	end
	def create
		@manga = Manga.create(manga_param)
		if @manga.save
			flash[:success] = 'Manga added successfully'
			redirect_to new_manga_chapter_path(@manga)
		else
			render :new
		end
	end
	def show
		@bookmark_status = is_present(@manga.users, current_user) ? 'Bookmark' : 'Unbookmark' if current_user.present?
		@comment = @manga.comments.build
		
	end
	def edit; end
	def update
		if @manga.update(manga_param)
			flash[:warning] = 'Manga Updated successfully'
			redirect_to mangas_path
		else
			render :edit
		end
	end
	def destroy
		if @manga.destroy
			flash[:danger] = 'Manga Deleted successfully'
			redirect_to mangas_path
		end
	end

	def bookmark_action
		
		if is_present(@manga.users, current_user)
			@manga.users << current_user
		else
			@manga.users.destroy(current_user.id)
		end
		redirect_to manga_path(@manga)
	end

	

	def categorized
		@sorted = []
		Manga.all.each do |manga|
			manga.categories.each do |cat|
				if cat == params[:type]
					@sorted.push(manga)
				end
			end
		end
		if @sorted.blank?
			flash[:info] = 'No Manga/Manhua/Manhwa in this category yet'
			redirect_to mangas_path
		else
			redirect_to sorted_mangas_path(@sorted)
		end
	end

	def filter
		@filtered_mangas = Manga.where("title LIKE ?", "%#{params[:search]}%")
		respond_to do |format|
		    format.js
		    format.html { redirect_to root_path }
  	  end
	end

	def search
	  @mangas = Manga.where("title LIKE ?", "%#{params[:q]}%")
	end

	private
	def is_present(mangas, user)
		mangas.each do |manga|
			if manga.email == user.email
				return false
			end
		end
		return true
	end

	def manga_param
		pp = params.require(:manga).permit(:title, :description, :author, :views, :bookmarked, :thumbnail, :likes, :category_id, categories:[])
		pp[:status] = params[:manga][:status].to_i
		return pp
	end

	def set_manga
		@manga = Manga.find(params[:id])
	end

end
