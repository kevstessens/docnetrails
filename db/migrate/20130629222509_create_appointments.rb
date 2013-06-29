class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :patient_id
      t.integer :doctor_id
      t.integer :ranking
      t.text :story_fragment
      t.datetime :datetime

      t.timestamps
    end
  end
end
