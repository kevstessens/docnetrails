class Hospital < ActiveRecord::Base
  belongs_to :address
  has_and_belongs_to_many :doctors
  attr_accessible :name
end
