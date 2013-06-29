class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.references :user
      t.time :hour_from
      t.time :hour_to
      t.time :shift_duration
      t.references :medical_specification

      t.timestamps
    end
    add_index :doctors, :user_id
    add_index :doctors, :medical_specification_id
  end
end
