class CreateIntermediateTables < ActiveRecord::Migration

  def change
    create_table :doctors_hospitals do |t|
      t.references :doctor
      t.references :hospital


      t.timestamps :default => Time.now
    end
    add_index :doctors_hospitals, :doctor_id
    add_index :doctors_hospitals, :hospital_id

    create_table :doctors_prepaid_medicals do |t|
      t.references :doctor
      t.references :prepaid_medical


      t.timestamps :default => Time.now
    end
    add_index :doctors_prepaid_medicals, :doctor_id
    add_index :doctors_prepaid_medicals, :prepaid_medical_id

    create_table :doctors_medical_specifications do |t|
      t.references :doctor
      t.references :medical_specification


      t.timestamps :default => Time.now
    end
    add_index :doctors_medical_specifications, :doctor_id
    add_index :doctors_medical_specifications, :medical_specification_id





  end

end
