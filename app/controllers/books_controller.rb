class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @books = Book.all
    if @book.save
      flash[:notice] = 'Book was successfully created.'
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @users = User.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:hoge] = "Book was successfully updated."
    redirect_to book_path(@book.id)
    else
    render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
    flash[:age] = "本当に削除しますか？"
    redirect_to '/books'
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
