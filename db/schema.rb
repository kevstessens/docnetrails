# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130703203110) do

  create_table "addresses", :force => true do |t|
    t.integer  "country_id"
    t.integer  "state_id"
    t.integer  "city_id"
    t.string   "street"
    t.string   "number"
    t.string   "postal_code"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "addresses", ["city_id"], :name => "index_addresses_on_city_id"
  add_index "addresses", ["country_id"], :name => "index_addresses_on_country_id"
  add_index "addresses", ["state_id"], :name => "index_addresses_on_state_id"

  create_table "appointments", :force => true do |t|
    t.integer  "patient_id"
    t.integer  "doctor_id"
    t.integer  "ranking"
    t.text     "story_fragment"
    t.datetime "datetime"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "medical_specification_id"
  end

  create_table "cities", :force => true do |t|
    t.integer  "state_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cities", ["state_id"], :name => "index_cities_on_state_id"

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "doctors", :force => true do |t|
    t.integer  "user_id"
    t.time     "hour_from"
    t.time     "hour_to"
    t.time     "shift_duration"
    t.integer  "medical_specification_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "doctors", ["medical_specification_id"], :name => "index_doctors_on_medical_specification_id"
  add_index "doctors", ["user_id"], :name => "index_doctors_on_user_id"

  create_table "doctors_hospitals", :force => true do |t|
    t.integer  "doctor_id"
    t.integer  "hospital_id"
    t.datetime "created_at",  :default => '2013-07-03 18:12:07', :null => false
    t.datetime "updated_at",  :default => '2013-07-03 18:12:07', :null => false
  end

  add_index "doctors_hospitals", ["doctor_id"], :name => "index_doctors_hospitals_on_doctor_id"
  add_index "doctors_hospitals", ["hospital_id"], :name => "index_doctors_hospitals_on_hospital_id"

  create_table "doctors_medical_specifications", :force => true do |t|
    t.integer  "doctor_id"
    t.integer  "medical_specification_id"
    t.datetime "created_at",               :default => '2013-07-03 18:12:07', :null => false
    t.datetime "updated_at",               :default => '2013-07-03 18:12:07', :null => false
  end

  add_index "doctors_medical_specifications", ["doctor_id"], :name => "index_doctors_medical_specifications_on_doctor_id"
  add_index "doctors_medical_specifications", ["medical_specification_id"], :name => "index_doctors_medical_specifications_on_medical_specification_id"

  create_table "doctors_prepaid_medicals", :force => true do |t|
    t.integer  "doctor_id"
    t.integer  "prepaid_medical_id"
    t.datetime "created_at",         :default => '2013-07-03 18:12:07', :null => false
    t.datetime "updated_at",         :default => '2013-07-03 18:12:07', :null => false
  end

  add_index "doctors_prepaid_medicals", ["doctor_id"], :name => "index_doctors_prepaid_medicals_on_doctor_id"
  add_index "doctors_prepaid_medicals", ["prepaid_medical_id"], :name => "index_doctors_prepaid_medicals_on_prepaid_medical_id"

  create_table "hospitals", :force => true do |t|
    t.string   "name"
    t.integer  "address_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "hospitals", ["address_id"], :name => "index_hospitals_on_address_id"

  create_table "medical_specifications", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "patients", :force => true do |t|
    t.integer  "user_id"
    t.integer  "prepaid_medical_id"
    t.integer  "address_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "patients", ["address_id"], :name => "index_patients_on_address_id"
  add_index "patients", ["prepaid_medical_id"], :name => "index_patients_on_prepaid_medical_id"
  add_index "patients", ["user_id"], :name => "index_patients_on_user_id"

  create_table "prepaid_medicals", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "states", :force => true do |t|
    t.integer  "country_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "states", ["country_id"], :name => "index_states_on_country_id"

  create_table "user_roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.integer  "user_role_id"
    t.string   "full_name"
    t.string   "email"
    t.date     "birthdate"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["user_role_id"], :name => "index_users_on_user_role_id"

end
