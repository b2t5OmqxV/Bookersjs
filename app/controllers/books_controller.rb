class BooksController < ApplicationController

  def index
  	@books = Book.all
    @book = Book.new
  end

  def show
  	@book = Book.find(params[:id])
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    if @book.save
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(id: @book.id)
    else
    render action: :index
    end
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
    @books = Book.all
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(id: @book.id)
    else
    render action: :edit
    end
  end

  def destroy
  	@book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path(@books)
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
