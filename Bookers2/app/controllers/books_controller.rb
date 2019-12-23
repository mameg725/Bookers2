class BooksController < ApplicationController

  before_action :authenticate
  def authenticate
  redirect_to new_user_session_path unless user_signed_in?
  end

  before_action :correct_user, only: [:edit, :update]
  def correct_user
    @book = Book.find(params[:id])
    redirect_to books_path unless current_user.id == @book.user.id
  end


  def create
  	@book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice:  "You have creatad book successfully."
    else
      @user = current_user
      @books = Book.all
      render "index"
    end
  end

  def index
    @user = current_user
  	@books = Book.all
    @book = Book.new
  end

  def show
    @books = Book.find(params[:id])
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end



  private
  def book_params
    params.require(:book).permit(:title, :body)
  end


end


