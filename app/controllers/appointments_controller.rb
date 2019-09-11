class AppointmentsController < ApplicationController
  before_action :set_physician

  def index
    @appointments = @physician.appointments
  end

  def new
    @patients= Patients.all - @physician.patients
    @appointment = @physician.appointments.new
  end

  def create
    @appointment = @physician.appointments.new(appointment_params)
    if @appointment.save
      redirect_to physician_appointments_path(@physician)
    else
      render :new
    end
  end

  def destroy
    @appointment = @physician.appointments.find(params[:id])
    @appointment.destroy
    redirect_to physician_appointments_path(@physician)
  end

 private
   def set_physician
     @physician = Physician.find(params[:physician_id]) 
   end

   def appointment_params
     params.require(:appointment).permit(patient_id)
   end
end