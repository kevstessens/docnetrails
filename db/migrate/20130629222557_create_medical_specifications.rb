class CreateMedicalSpecifications < ActiveRecord::Migration
  def change
    create_table :medical_specifications do |t|
      t.string :name

      t.timestamps
    end
  end
end
