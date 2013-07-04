class AddAssistedFieldToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :assisted, :boolean, :default => false
  end
end
