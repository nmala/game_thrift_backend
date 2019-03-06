class Api::V1::UsersController < ApplicationController
  before_action :find_user, only: [:show]

  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def create
    @user = user.create(user_params)
    render json: @user, status: :ok
  end

  def show
    render json: @user, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end

  def find_user
    @user = user.find(params[:id])
  end
end
