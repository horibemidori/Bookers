class BooksController < ApplicationController
  def index
     @book = Book.new
    @books = Book.all
  end

  def creat
    book = Book.new(book_params)
    book.save
    redirect_to '/books/index'
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end


  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to show_book_path(book.id)
  end

  def destroy
   book = Book.find(params[:id])
   book.destroy
   redirect_to books_index_path
  end

  private
   def book_params
    params.require(:book).permit(:title, :body)
   end

end