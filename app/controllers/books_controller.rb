class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @books = Book.all
    @book.save
    if @book.save
      flash[:success] = 'Book was successfully created.'
      redirect_to book_path(@book.id)
    else
      render:'index'
    end
  end

  def show
    @books = Book.find(params[:id])
  end

  def edit
    @books = Book.find(params[:id])
  end

  def update
    @books = Book.find(params[:id])
    @books.update(book_params)
    if @books.update(book_params)
      flash[:success] = 'Book was successfully updated.'
      redirect_to book_path(@books.id)
    else
      render:'edit'
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:success] = 'Book was successfully destroyed.'
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end


end
