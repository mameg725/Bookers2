class UsersController < ApplicationController
	 before_action :authenticate
	def authenticate
		redirect_to new_user_session_path unless user_signed_in?
	end

	before_action :correct_user, only: [:edit, :update]
	def correct_user
		@user = User.find(params[:id])
		redirect_to user_path(current_user) unless current_user.id == @user.id
	end



	def index
		@user = current_user
		@users = User.all
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@book.save
		redirect_to book_path(@book), notice:  "You have creatad book successfully."
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
		if @user.update(user_params)
			redirect_to user_path(current_user), notice: "You have updated user successfully."
		else
			render "edit"
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
	end
end
