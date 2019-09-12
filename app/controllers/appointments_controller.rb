class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show]
  before_action :set_physician
  before_action :set_patients, only: [:new, :create]

  def index
    @appointments = @physician.appointments
  end

  def show
    @patient = @appointment.patient.find(params[:id])
    @physician = @appointment.physician.find(params[physician_id])
  end

  def new
    @patient = Patient.all
    @appointment = @physician.appointments.new
  end

  def create
    @patient = Patient.all
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
     params.require(:appointment).permit(patient_url @patient)
   end
end
