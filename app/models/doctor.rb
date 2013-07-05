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

  validates_presence_of :prepaid_medicals

  def hospital_tokens=(ids)
    self.hospital_ids = ids.split(",")
  end

  def prepaid_medical_tokens=(ids)
    self.prepaid_medical_ids = ids.split(",")
  end

  def medical_specification_tokens=(ids)
    self.medical_specification_ids = ids.split(",")
  end

  def list_specifications
    specifications = ""
    self.medical_specifications.each do |specification|
      if medical_specifications.last == specification
        specifications = specifications + specification.name
      else
        specifications = specifications + specification.name + ", "

      end

    end
    return specifications
  end

  def list_hospitals
    hospitals_list = ""
    self.hospitals.each do |hospital|
      if hospitals.last == hospital
        hospitals_list = hospitals_list + hospital.name
      else
        hospitals_list = hospitals_list + hospital.name + ", "

      end

    end
    return hospitals_list
  end

  def list_prepaids
    prepaids = ""
    self.prepaid_medicals.each do |prepaid|
      if prepaid_medicals.last == prepaid
        prepaids = prepaids + prepaid.name
      else
        prepaids = prepaids + prepaid.name + ", "

      end

    end
    return prepaids
  end

end
