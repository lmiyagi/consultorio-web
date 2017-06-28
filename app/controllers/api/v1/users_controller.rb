class Api::V1::UsersController < Api::V1::ApiController
  before_action :require_authentication, except: [:index, :new, :create]

  def index
    @users = User.all
    respond_with @users, location: ''
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user.present?
      respond_with @user, location: ''
    else
      render_not_found_error
    end
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def current_user
    @current_user ||= authenticate_token
  end
end