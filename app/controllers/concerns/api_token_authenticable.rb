include APICommonErrors

module APITokenAuthenticable
  extend ActiveSupport::Concern

  def require_authentication
    return true if authenticate_token
    render_unauthorized_error
  end

  def authenticate_token
    user = User.find_for_database_authentication(email: request.params[:email])
    if user.present? && user.authentication_token.present? && user.authentication_token == request.params[:token]
      sign_in user, store: false
      true
    else
      false
    end
  end
end
