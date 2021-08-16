class BooksController < ApplicationController

  def index
    @book = Book.new
    @user = User.find(current_user.id)

    @books = Book.all

    @users = User.all

  end

  def show
    @book = Book.new
    @user = User.find(current_user.id)
    
    @book = Book.find(params[:id])

    @users = User.all

  end

  def create
    @book = Book.new(params[:id])
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
    book.destroy
    redirect_to books_path

  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
