class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show]
  before_action :set_doctor
  before_action :set_patients, only: [:new, :create]

  def index
    @appointments = @physician.appointments
  end

  def new
    @patients = Patient.all - @physician.patients
    @appointment = @physician.appointments.new
  end

  def show
    @patient = @appointment.patient.find(params[:id])
    @doctor = @appointment.doctor.find(params[:doctor_id])
  end

  def new
    @patients = Patient.all - @physician.patients
    @appointment = @physician.appointments.new
  end

  def create
    @appointment = @physician.appointments.new(appointment_params)
    
    if @appointment.save
      redirect_to physician_appointments_path
    else
      render :new
    end
  end

  def destroy
    @physician.appointments.find(params[:id]).destroy
    redirect_to physician_appointments_path
  end

  private
    def set_physician
      @physician = Physician.find(params[:physician_id])
    end

    def set_appointment
    @appointment = Appointment.find(params[:id])
    end

    def set_patients
    @patients = (Patient.all - @physician.patients)
    end

    def appointment_params
    params.require(:appointment).permit(:patient_id, :date, :time)
    end
  end
end
  

    

