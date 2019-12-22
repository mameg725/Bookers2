class UsersController < ApplicationController
	def index
		@user = current_user
		@users = User.all
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			redirect_to book_path(@book), notice: "aaa"
		end
	end

	def show
		@user = User.find(params[:id])
		@book = Book.new
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path(current_user)
	end

	private
	def user_params
		params.require(:user).permit(:name, :profile_image_id, :introduction)
	end
end
