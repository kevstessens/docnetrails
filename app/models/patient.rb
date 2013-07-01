class Patient < ActiveRecord::Base
  belongs_to :user
  belongs_to :prepaid_medical
  belongs_to :address
  has_many :appointments

  attr_accessible :prepaid_medical, :address, :user, :prepaid_medical_id, :prepaid_medicals_id

end
