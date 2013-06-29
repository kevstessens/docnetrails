class PrepaidMedical < ActiveRecord::Base
  has_many :patients
  has_and_belongs_to_many :doctors
  attr_accessible :name
end
