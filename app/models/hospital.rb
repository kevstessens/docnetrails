class Hospital < ActiveRecord::Base
  belongs_to :address
  has_and_belongs_to_many :doctors
  attr_accessible :name, :doctors, :doctor_ids, :address_id
  attr_reader :doctor_tokens

  def doctor_tokens=(ids)
    self.doctor_ids = ids.split(",")
  end
end
