class Appointment < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :patient

  attr_accessible :datetime, :doctor_id, :patient_id, :ranking, :story_fragment, :medical_specification_id, :assisted
end
