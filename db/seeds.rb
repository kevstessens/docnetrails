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
