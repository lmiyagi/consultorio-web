class Api::V1::Users::AppointmentsController < Api::V1::ApiController
  before_action :require_authentication

  def show
    @appointment = current_user.appointments.find_by(id: params[:id])
    respond_with @appointment, location: ''
  end
end