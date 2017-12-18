class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  def new
    @user=User.new
  end

  def index
    @user=User.all
  end

  def show
  end

  def destroy
    @user.destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end

  def update
    if @user.update_attributes(user_params)
      flash[:notice] = 'Updated user successfully!'
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'Created user successfully!'
      sign_in @user
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
  end

  private
  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name,:phone,:password,:password_confirmation)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
end


