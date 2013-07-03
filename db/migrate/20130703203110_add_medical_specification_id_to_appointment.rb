class AddMedicalSpecificationIdToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :medical_specification_id, :string
  end
end
