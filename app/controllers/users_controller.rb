class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create({ password: user_params[:cns] }.merge(user_params))
    if @user.save
      redirect_to users_path, status: 201
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :cpf, :email, :phone, :cns, :type)
  end

end