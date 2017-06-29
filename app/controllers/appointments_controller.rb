class AppointmentsController < ApplicationController

  def index
    @appointments = Appointment.all
  end

  def confirm
    @appointment = Appointment.find(params[:id])
    if @appointment.present?
      @appointment.update(situation: :scheduled)
      redirect_to appointments_path
    else
      render_not_found_error
    end
  end

  def cancel
    @appointment = Appointment.find(params[:id])
    if @appointment.present?
      @appointment.update(situation: :cancelled)
      redirect_to appointments_path
    else
      render_not_found_error
    end
  end
end