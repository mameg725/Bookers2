class BookController < ApplicationController
	def new
	end

	def create
	end

	def index
		@books = Book.all
	end

	def show
	end
end
