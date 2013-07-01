class MedicalSpecification < ActiveRecord::Base

  has_and_belongs_to_many :doctors


  attr_accessible :name, :doctor_ids
  attr_reader :doctor_tokens

  def doctor_tokens=(ids)
    self.doctor_ids = ids.split(",")
  end
end
