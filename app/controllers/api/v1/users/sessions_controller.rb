class Api::V1::Users::SessionsController < Api::V1::ApiController
  before_action :require_authentication, only: :destroy

  def create
    puts params[:cpf]
    @user = User.find_for_database_authentication(cpf: params[:cpf])
    @user ||= User.new

    if @user.valid_password?(params[:password])
      token = @user.generate_auth_token
      @user.show_token = true
      respond_with @user, location: ''
    else
      render_unauthorized_error
    end
  end

  def destroy
  end

end
