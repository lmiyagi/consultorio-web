class Api::V1::Users::UsersController < Api::V1::ApiController
  before_action :require_authentication

  def change_password
    @user = current_user
    if @user.valid_password?(params[:old_password])
      @user.update(password: params[:new_password], default_password: false)
      respond_with @user, location: '', status: :ok
    else
      render json: APIErrorSerializer.serialize(:wrong_login), status: :unprocessable_entity
    end
  end
end