class UserRole < ActiveRecord::Base
  attr_accessible :name

  def self.doctor
    UserRole.where(:name => "Doctor").first
  end

  def self.admin
    UserRole.where(:name => "Admin").first
  end

  def self.paciente
    UserRole.where(:name => "Paciente").first
  end

  def ==(o)
    o.class == self.class && o.name == name
  end
end
