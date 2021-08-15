class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.all
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  def create
    @book = Book.new(book_params)
    @books = Book.all
    @book.user_id = current_user.id
    if @book.save
     flash[:notice] ="Book was successfully created"
    redirect_to books_path(@book.id)
    else
    render action: :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] ="Book was successfully updated"
    redirect_to book_path(@book)
    else
    render action: :edit
  end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:notice] ="Book was successfully delete"
    redirect_to books_path
    else
    render action: :index
  end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
