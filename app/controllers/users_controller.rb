class UsersController < ApplicationController

  def index
    @user = current_user
    @users = User.all
    @newbook = Book.new
  end

  def show
    @user = User.find(params[:id])
    @user = current_user
    @newbook = Book.new
    @books = @user.books.reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] ="You have updated user successfully."
    redirect_to user_path(@user)
    else
    render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
