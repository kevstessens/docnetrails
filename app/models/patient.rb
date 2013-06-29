class Patient < ActiveRecord::Base
  belongs_to :user
  belongs_to :prepaid_medical
  belongs_to :address
  has_many :appointments

  # attr_accessible :title, :body
end
