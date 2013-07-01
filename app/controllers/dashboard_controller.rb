class DashboardController < ApplicationController


  before_filter :set_active_tab

  def index

    @dashboard_page = true

    if current_user.user_role == UserRole.paciente
    @appointments = Appointment.where("patient_id = ?", current_user.patient.id)
    elsif current_user.user_role == UserRole.doctor
    @appointments = Appointment.where("doctor_id = ?", current_user.doctor.id)
    end


  end

  def statistics
    back_path = root_path
  end  

  private
  def set_active_tab
    @active_tab = "dashboard"
  end

end



