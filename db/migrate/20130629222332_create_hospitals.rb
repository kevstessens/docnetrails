class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.string :name
      t.references :address

      t.timestamps
    end
    add_index :hospitals, :address_id
  end
end
