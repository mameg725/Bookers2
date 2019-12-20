class UsersController < ApplicationController
	def index
		@user = current_user
		@users = User.all
		@book = Book.new
	end

	def show
		user = User.find(params[:id])
		@book = Book.new
	end

	def edit
		user = User.find(params[:id])
	end

	private
	def user_params
		params.require(:user).permit(:name, :post_image_id, :introduction)
	end
end
