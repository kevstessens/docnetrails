class Doctor < ActiveRecord::Base
  belongs_to :user
  has_many :appointments
  has_and_belongs_to_many :hospitals
  has_and_belongs_to_many :prepaid_medicals
  has_and_belongs_to_many :medical_specification

  attr_accessible :hour_from, :hour_to, :shift_duration, :user_id

end
