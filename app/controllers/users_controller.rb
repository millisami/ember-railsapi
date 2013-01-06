class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: user
  end
end
