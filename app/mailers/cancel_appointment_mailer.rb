#encoding: utf-8
class CancelAppointmentMailer < ActionMailer::Base
  default :from => "admin@docnet.com"
  default :to => "user@user.com"


  def cancel_appointment(appointment, user)
    @appointment = appointment
    @user = user
    mail(:subject => t("mailers.cancelled_appointment") + appointment.datetime.strftime("%d/%m/%y"), :to => user.email)
  end

end