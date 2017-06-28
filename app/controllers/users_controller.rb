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
    # todo password error
    @user = User.create({ password: user_params[:cns] }.merge(user_params))
    if @user.save
      redirect_to root_url
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