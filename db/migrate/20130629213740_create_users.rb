class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :user_role
      t.string :full_name
      t.string :email
      t.date :birthdate

      t.timestamps
    end
    add_index :users, :user_role_id
  end
end
