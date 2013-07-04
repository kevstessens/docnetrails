class Appointment < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :patient

  attr_accessible :datetime, :doctor_id, :patient_id, :ranking, :story_fragment, :medical_specification_id, :assisted

  def self.reminder_mail
    Appointment.all.each do |appointment|
      if appointment.datetime.to_date == DateTime.current.advance(:days=> 1).to_date
        unless appointment.patient_id == 1
          AppointmentReminderMailer.remind_appointment(appointment, appointment.patient.user).deliver
        end
      end
    end
  end
end
