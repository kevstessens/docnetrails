#encoding: utf-8
class NewDoctorMailer < ActionMailer::Base
  default :from => "admin@docnet.com"
  default :to => "user@user.com"


  def new_doctor_created(user)
    @doctor = user.doctor
    mail(:subject => t("mailers.new_patient_subject") + user.full_name, :to => user.email)
  end

end