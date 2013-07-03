class Patient < ActiveRecord::Base
  belongs_to :user
  belongs_to :prepaid_medical
  belongs_to :address
  has_many :appointments

  attr_accessible :prepaid_medical, :address, :user, :prepaid_medical_id, :prepaid_medicals_id

  def previous_story(appointment_recieved)
    story = Array.new
    Appointment.where("patient_id = ? and datetime < ? and medical_specification_id = ?", self.id, appointment_recieved.datetime, appointment_recieved.medical_specification_id ).each do |appointment|
      story.append(appointment.datetime.strftime("%d/%m/%y") + ": " + appointment.story_fragment)
    end
    return story
  end

end
