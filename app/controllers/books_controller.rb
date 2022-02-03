class BooksController < ApplicationController
  before_action :authenticate_user!

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @user = current_user
    @book.user = current_user
    @books = Book.all
    if @book.save
      flash[:notice] = 'You have created book successfully.'
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render :edit
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:hoge] = "You have updated book successfully."
    redirect_to book_path(@book.id)
    else
    render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
    redirect_to '/books'
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
