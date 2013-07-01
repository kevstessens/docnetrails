class User < ActiveRecord::Base

  belongs_to :user_role
  has_one :doctor
  has_one :patient



  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :birthdate, :full_name, :user_role_id, :patient_attributes, :patient, :doctor_attributes, :doctor,:prepaid_medical_id
  attr_accessor :prepaid_medical_id
  attr_readonly :prepaid_medical_id


  accepts_nested_attributes_for :doctor, :allow_destroy => true
  accepts_nested_attributes_for :patient, :allow_destroy => true
end
