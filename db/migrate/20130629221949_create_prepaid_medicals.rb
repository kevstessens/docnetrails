class CreatePrepaidMedicals < ActiveRecord::Migration
  def change
    create_table :prepaid_medicals do |t|
      t.string :name

      t.timestamps
    end
  end
end
