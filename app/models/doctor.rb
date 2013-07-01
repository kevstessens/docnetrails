class Doctor < ActiveRecord::Base
  belongs_to :user
  has_many :appointments
  has_and_belongs_to_many :hospitals
  has_and_belongs_to_many :prepaid_medicals
  has_and_belongs_to_many :medical_specifications

  attr_accessible :hour_from, :hour_to, :shift_duration, :user_id, :hospital_tokens, :hospital_ids, :medical_specification_ids, :prepaid_medical_ids
  attr_reader :hospital_tokens #getter
  attr_reader :prepaid_medical_tokens #getter
  attr_reader :medical_specification_tokens #getter


  def hospital_tokens=(ids)
    self.hospital_ids = ids.split(",")
  end

  def prepaid_medical_tokens=(ids)
    self.prepaid_medical_ids = ids.split(",")
  end

  def medical_specification_tokens=(ids)
    self.medical_specification_ids = ids.split(",")
  end
end
