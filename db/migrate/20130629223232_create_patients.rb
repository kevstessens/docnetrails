class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.references :user
      t.references :prepaid_medical
      t.references :address

      t.timestamps
    end
    add_index :patients, :user_id
    add_index :patients, :prepaid_medical_id
    add_index :patients, :address_id
  end
end
