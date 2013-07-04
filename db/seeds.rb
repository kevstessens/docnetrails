# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


UserRole.create!(:name => "Admin")
UserRole.create!(:name => "Doctor")
UserRole.create!(:name => "Paciente")

User.create!(:email => "admin@docnet.com", :password => "docnet123", :full_name => "Admin Docnet", :user_role_id => 1)

MedicalSpecification.create!(:name => "Cardiologia")
MedicalSpecification.create!(:name => "Otorrinolaringologia")
MedicalSpecification.create!(:name => "Dentista")

PrepaidMedical.create!(:name => "Osde 210")
PrepaidMedical.create!(:name => "Osde 310")
PrepaidMedical.create!(:name => "Galeno plata")
PrepaidMedical.create!(:name => "Galeno oro")
PrepaidMedical.create!(:name => "Swiss Medical")

Hospital.create!(:name => "Aleman")
Hospital.create!(:name => "S. Juan de Dios")
Hospital.create!(:name => "Austral")
Hospital.create!(:name => "Italiano")

User.create!(:email => "default@docnet.com", :password => "docnet123", :full_name => "N/A", :user_role_id => 3)
Patient.create(:user_id => 2)
