class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :country
      t.references :state
      t.references :city
      t.string :street
      t.string :number
      t.string :postal_code

      t.timestamps
    end
    add_index :addresses, :country_id
    add_index :addresses, :state_id
    add_index :addresses, :city_id
  end
end
