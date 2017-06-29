class Api::V1::Users::AppointmentsController < Api::V1::ApiController
  before_action :require_authentication

  def create
    @appointment = current_user.appointments.create(date: Time.parse(appointment_params[:date]))
    if @appointment.save
      respond_with @appointment, location: ''
    else
      render_unprocessable_error
    end
  end

  def show
    @appointment = current_user.appointments.find_by(id: params[:id])
    if @appointment.present?
      respond_with @appointment, location: ''
    else
      render_not_found_error
    end
  end

  private

  def appointment_params
    params.permit(:date)
  end
end