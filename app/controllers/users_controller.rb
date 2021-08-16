class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user = current_user
    @newbook = Book.new
    @books = Book.all
  end

  def index
    @user = current_user
    @users = User.all
    @newbook = Book.new
    @books = Book.all
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
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
