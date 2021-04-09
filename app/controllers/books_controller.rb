class BooksController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user, only:[:edit, :update]

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@book.save
		redirect_to books_path
	end

	def index
		@books = Book.all.order(created_at: :desc)
	end

	def show
		@book = Book.find(params[:id])
	end

	def edit
		@book = Book.find(params[:id])
	end

	def destroy
		@book = Book.find(params[:book_id])
		@book.destroy
		redirect_to books_path
	end

	def update
		@book = Book.find(params[:book_id])
		unless @book.user_id.present?
			@book.user_id = current_user.id
		end
		@book.update(book_params)
		redirect_to books_path(@book.id)
	end

private
	def book_params
		params.require(:book).permit(:title, :user_id, :opinion)
	end

  def correct_user
    book = Book.find(params[:book_id])
    if current_user.id != book.user_id
      redirect_to root_path
    end
  end
end
