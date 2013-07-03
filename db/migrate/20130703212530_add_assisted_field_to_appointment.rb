class AddAssistedFieldToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :assisted, :boolean
  end
end
