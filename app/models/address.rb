class Address < ActiveRecord::Base
  belongs_to :country
  belongs_to :state
  belongs_to :city
  has_one :hospital
  has_one :patient
  attr_accessible :number, :postal_code, :street, :country_id, :state_id, :city_id
end
