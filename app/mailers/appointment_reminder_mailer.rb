#encoding: utf-8
class AppointmentReminderMailer < ActionMailer::Base
  default :from => "admin@docnet.com"
  default :to => "user@user.com"


  def remind_appointment(appointment, user)
    @appointment = appointment
    @user = user
    mail(:subject => t("mailers.remember_your_appointment") + appointment.datetime.advance(:hours =>3).strftime("%H:%M"), :to => user.email)
  end



end