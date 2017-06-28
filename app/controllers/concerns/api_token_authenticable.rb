include APICommonErrors

module APITokenAuthenticable
  extend ActiveSupport::Concern

  def require_authentication
    return true if authenticate_token
    render_unauthorized_error
  end

  def authenticate_token
    user = User.find_by(email: request.params[:email])
    user.present? && user.authentication_token.present? && user.authentication_token == request.params[:token]
  end
end
