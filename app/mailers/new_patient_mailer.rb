#encoding: utf-8
class NewPatientMailer < ActionMailer::Base
  default :from => "admin@docnet.com"
  default :to => "user@user.com"


  def new_patient_created(patient)
    @patient = patient
    mail(:subject => t("mailers.new_patient_subject") + patient.user.full_name, :to => patient.user.email)
  end

end