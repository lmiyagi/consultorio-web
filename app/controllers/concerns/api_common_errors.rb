module APICommonErrors
  extend ActiveSupport::Concern

  def render_unprocessable_error
    render json: APIErrorSerializer.serialize(:unprocessable_entity), status: :unprocessable_entity
  end

  def render_unauthorized_error
    render json: APIErrorSerializer.serialize(:unauthorized), status: :unauthorized
  end

  def render_not_found_error
    render json: APIErrorSerializer.serialize(:not_found), status: :not_found
  end

end
