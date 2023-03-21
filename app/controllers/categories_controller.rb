class CategoriesController < ApplicationController
	before_action :set_category, only: %i[show edit update destroy]
	def index
		@categories = Category.all
	end
	def new
		@category = Category.new
	end
	def create
		Category.create(category_param)
		redirect_to categories_path
	end
	def show
	end
	def edit
	end
	def update
		@category.update(category_param)
	end
	def destroy
		@category.destroy
	end

	private

	def category_param
		params.require(:category).permit(:name)
	end

	def set_category
		@category = Category.find(params[:id])
	end
end
