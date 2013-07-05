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
  attr_accessible :email, :password, :password_confirmation, :remember_me, :birthdate, :full_name, :user_role_id, :patient_attributes, :patient, :doctor_attributes, :doctor,:prepaid_medical_id, :datetime, :patient_id
  attr_accessor :prepaid_medical_id, :datetime
  attr_readonly :prepaid_medical_id

  validates_presence_of :full_name, :email, :encrypted_password

  accepts_nested_attributes_for :doctor, :allow_destroy => true
  accepts_nested_attributes_for :patient, :allow_destroy => true

  def calculate_ranking
    rank = 0
    counting = 0
    if self.user_role == UserRole.paciente
      Appointment.where("patient_id = ?", self.patient.id).all.each do |app|
        rank = app.ranking.to_i + rank
        counting = counting + 1
      end
      if counting == 0
        return "N/A"
      else
        if Integer(rank/counting).to_s == "0"
          "N/A"
        else
          return Integer(rank/counting).to_s
        end
      end
    else
       "N/A"
    end
  end
end
