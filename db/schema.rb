# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_19_193333) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "province"
    t.string "city"
    t.string "district"
    t.string "latitude"
    t.string "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admin_addresses", force: :cascade do |t|
    t.bigint "address_id", null: false
    t.bigint "admin_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_admin_addresses_on_address_id"
    t.index ["admin_id"], name: "index_admin_addresses_on_admin_id"
  end

  create_table "admin_contacts", force: :cascade do |t|
    t.bigint "contact_id", null: false
    t.bigint "admin_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_admin_contacts_on_admin_id"
    t.index ["contact_id"], name: "index_admin_contacts_on_contact_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "role"
    t.string "status"
    t.datetime "last_login_at"
    t.string "last_login_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "password"
  end

  create_table "agent_addresses", force: :cascade do |t|
    t.bigint "address_id", null: false
    t.bigint "agent_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_agent_addresses_on_address_id"
    t.index ["agent_id"], name: "index_agent_addresses_on_agent_id"
  end

  create_table "agent_contacts", force: :cascade do |t|
    t.bigint "contact_id", null: false
    t.bigint "agent_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_agent_contacts_on_agent_id"
    t.index ["contact_id"], name: "index_agent_contacts_on_contact_id"
  end

  create_table "agent_reports", force: :cascade do |t|
    t.bigint "report_id", null: false
    t.bigint "user_id", null: false
    t.bigint "agent_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_agent_reports_on_agent_id"
    t.index ["report_id"], name: "index_agent_reports_on_report_id"
    t.index ["user_id"], name: "index_agent_reports_on_user_id"
  end

  create_table "agent_reviews", force: :cascade do |t|
    t.bigint "agent_id", null: false
    t.bigint "appointment_id", null: false
    t.bigint "user_id", null: false
    t.bigint "review_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_agent_reviews_on_agent_id"
    t.index ["appointment_id"], name: "index_agent_reviews_on_appointment_id"
    t.index ["review_id"], name: "index_agent_reviews_on_review_id"
    t.index ["user_id"], name: "index_agent_reviews_on_user_id"
  end

  create_table "agents", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "admin_id", null: false
    t.date "hire_date"
    t.index ["admin_id"], name: "index_agents_on_admin_id"
  end

  create_table "amenities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "fee"
    t.string "fee_duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "property_id", null: false
    t.index ["property_id"], name: "index_amenities_on_property_id"
  end

  create_table "appointment_addresses", force: :cascade do |t|
    t.bigint "address_id", null: false
    t.bigint "appointment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_appointment_addresses_on_address_id"
    t.index ["appointment_id"], name: "index_appointment_addresses_on_appointment_id"
  end

  create_table "appointments", force: :cascade do |t|
    t.datetime "date_time"
    t.string "status"
    t.text "notes"
    t.bigint "user_id", null: false
    t.bigint "property_id", null: false
    t.bigint "agent_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_appointments_on_agent_id"
    t.index ["property_id"], name: "index_appointments_on_property_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "cars", force: :cascade do |t|
    t.string "brand"
    t.string "model"
    t.integer "year"
    t.integer "mile_age"
    t.string "transmission"
    t.string "fuel_type"
    t.integer "engine_size"
    t.string "body_style"
    t.integer "identity_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "property_id", null: false
    t.index ["property_id"], name: "index_cars_on_property_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "type"
    t.string "phone_number_one"
    t.string "phone_number_two"
    t.string "email_one"
    t.string "email_two"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deal_infos", force: :cascade do |t|
    t.string "type"
    t.integer "duration"
    t.integer "price_per_duration"
    t.integer "total_price"
    t.integer "total_duration"
    t.bigint "property_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_deal_infos_on_property_id"
  end

  create_table "deals", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "agent_id", null: false
    t.bigint "deal_info_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_deals_on_agent_id"
    t.index ["deal_info_id"], name: "index_deals_on_deal_info_id"
    t.index ["user_id"], name: "index_deals_on_user_id"
  end

  create_table "home_rooms", force: :cascade do |t|
    t.integer "width"
    t.integer "length"
    t.integer "windows"
    t.boolean "cup_board"
    t.boolean "to_sun"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "home_id", null: false
    t.index ["home_id"], name: "index_home_rooms_on_home_id"
  end

  create_table "homes", force: :cascade do |t|
    t.string "owner_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "property_id", null: false
    t.index ["property_id"], name: "index_homes_on_property_id"
  end

  create_table "lands", force: :cascade do |t|
    t.integer "area"
    t.string "zone"
    t.string "current_use"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "property_id", null: false
    t.index ["property_id"], name: "index_lands_on_property_id"
  end

  create_table "offers", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.string "title"
    t.text "description"
    t.bigint "deal_info_id", null: false
    t.integer "offer_price"
    t.bigint "property_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deal_info_id"], name: "index_offers_on_deal_info_id"
    t.index ["property_id"], name: "index_offers_on_property_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "type"
    t.string "name"
    t.text "description"
    t.string "availability_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "property_manager_id", null: false
    t.bigint "agent_id", null: false
    t.index ["agent_id"], name: "index_properties_on_agent_id"
    t.index ["property_manager_id"], name: "index_properties_on_property_manager_id"
  end

  create_table "property_addresses", force: :cascade do |t|
    t.bigint "address_id", null: false
    t.bigint "property_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_property_addresses_on_address_id"
    t.index ["property_id"], name: "index_property_addresses_on_property_id"
  end

  create_table "property_manager_addresses", force: :cascade do |t|
    t.bigint "address_id", null: false
    t.bigint "property_manager_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_property_manager_addresses_on_address_id"
    t.index ["property_manager_id"], name: "index_property_manager_addresses_on_property_manager_id"
  end

  create_table "property_manager_contacts", force: :cascade do |t|
    t.bigint "contact_id", null: false
    t.bigint "property_manager_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_id"], name: "index_property_manager_contacts_on_contact_id"
    t.index ["property_manager_id"], name: "index_property_manager_contacts_on_property_manager_id"
  end

  create_table "property_manager_reviews", force: :cascade do |t|
    t.bigint "agent_id", null: false
    t.bigint "property_manager_id", null: false
    t.bigint "appointment_id", null: false
    t.bigint "review_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_property_manager_reviews_on_agent_id"
    t.index ["appointment_id"], name: "index_property_manager_reviews_on_appointment_id"
    t.index ["property_manager_id"], name: "index_property_manager_reviews_on_property_manager_id"
    t.index ["review_id"], name: "index_property_manager_reviews_on_review_id"
  end

  create_table "property_managers", force: :cascade do |t|
    t.string "name"
    t.string "company_name"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "agent_id", null: false
    t.index ["agent_id"], name: "index_property_managers_on_agent_id"
  end

  create_table "property_reports", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "report_id", null: false
    t.bigint "property_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_property_reports_on_property_id"
    t.index ["report_id"], name: "index_property_reports_on_report_id"
    t.index ["user_id"], name: "index_property_reports_on_user_id"
  end

  create_table "reports", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "type"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restrictions", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "property_id", null: false
    t.index ["property_id"], name: "index_restrictions_on_property_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "type"
    t.integer "rating"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suggestions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_suggestions_on_user_id"
  end

  create_table "trainer_reviews", force: :cascade do |t|
    t.bigint "agent_id", null: false
    t.bigint "trainer_id", null: false
    t.bigint "review_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_trainer_reviews_on_agent_id"
    t.index ["review_id"], name: "index_trainer_reviews_on_review_id"
    t.index ["trainer_id"], name: "index_trainer_reviews_on_trainer_id"
  end

  create_table "trainers", force: :cascade do |t|
    t.bigint "agent_id", null: false
    t.string "feild"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_trainers_on_agent_id"
  end

  create_table "training_records", force: :cascade do |t|
    t.integer "score"
    t.bigint "trainer_id", null: false
    t.bigint "agent_id", null: false
    t.bigint "training_id", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_training_records_on_agent_id"
    t.index ["trainer_id"], name: "index_training_records_on_trainer_id"
    t.index ["training_id"], name: "index_training_records_on_training_id"
  end

  create_table "trainings", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_addresses", force: :cascade do |t|
    t.bigint "address_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_user_addresses_on_address_id"
    t.index ["user_id"], name: "index_user_addresses_on_user_id"
  end

  create_table "user_contacts", force: :cascade do |t|
    t.bigint "contact_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_id"], name: "index_user_contacts_on_contact_id"
    t.index ["user_id"], name: "index_user_contacts_on_user_id"
  end

  create_table "user_favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "property_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_user_favorites_on_property_id"
    t.index ["user_id"], name: "index_user_favorites_on_user_id"
  end

  create_table "user_reviews", force: :cascade do |t|
    t.bigint "agent_id", null: false
    t.bigint "user_id", null: false
    t.bigint "appointment_id", null: false
    t.bigint "review_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_user_reviews_on_agent_id"
    t.index ["appointment_id"], name: "index_user_reviews_on_appointment_id"
    t.index ["review_id"], name: "index_user_reviews_on_review_id"
    t.index ["user_id"], name: "index_user_reviews_on_user_id"
  end

  create_table "user_searches", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.text "term"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_searches_on_user_id"
  end

  create_table "user_views", force: :cascade do |t|
    t.bigint "property_id", null: false
    t.bigint "user_id", null: false
    t.time "time_spent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_user_views_on_property_id"
    t.index ["user_id"], name: "index_user_views_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.date "date_of_birth"
    t.string "gender"
    t.string "push_token"
    t.datetime "last_login"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "admin_addresses", "addresses"
  add_foreign_key "admin_addresses", "admins"
  add_foreign_key "admin_contacts", "admins"
  add_foreign_key "admin_contacts", "contacts"
  add_foreign_key "agent_addresses", "addresses"
  add_foreign_key "agent_addresses", "agents"
  add_foreign_key "agent_contacts", "agents"
  add_foreign_key "agent_contacts", "contacts"
  add_foreign_key "agent_reports", "agents"
  add_foreign_key "agent_reports", "reports"
  add_foreign_key "agent_reports", "users"
  add_foreign_key "agent_reviews", "agents"
  add_foreign_key "agent_reviews", "appointments"
  add_foreign_key "agent_reviews", "reviews"
  add_foreign_key "agent_reviews", "users"
  add_foreign_key "agents", "admins"
  add_foreign_key "amenities", "properties"
  add_foreign_key "appointment_addresses", "addresses"
  add_foreign_key "appointment_addresses", "appointments"
  add_foreign_key "appointments", "agents"
  add_foreign_key "appointments", "properties"
  add_foreign_key "appointments", "users"
  add_foreign_key "cars", "properties"
  add_foreign_key "deal_infos", "properties"
  add_foreign_key "deals", "agents"
  add_foreign_key "deals", "deal_infos"
  add_foreign_key "deals", "users"
  add_foreign_key "home_rooms", "homes"
  add_foreign_key "homes", "properties"
  add_foreign_key "lands", "properties"
  add_foreign_key "offers", "deal_infos"
  add_foreign_key "offers", "properties"
  add_foreign_key "properties", "agents"
  add_foreign_key "properties", "property_managers"
  add_foreign_key "property_addresses", "addresses"
  add_foreign_key "property_addresses", "properties"
  add_foreign_key "property_manager_addresses", "addresses"
  add_foreign_key "property_manager_addresses", "property_managers"
  add_foreign_key "property_manager_contacts", "contacts"
  add_foreign_key "property_manager_contacts", "property_managers"
  add_foreign_key "property_manager_reviews", "agents"
  add_foreign_key "property_manager_reviews", "appointments"
  add_foreign_key "property_manager_reviews", "property_managers"
  add_foreign_key "property_manager_reviews", "reviews"
  add_foreign_key "property_managers", "agents"
  add_foreign_key "property_reports", "properties"
  add_foreign_key "property_reports", "reports"
  add_foreign_key "property_reports", "users"
  add_foreign_key "restrictions", "properties"
  add_foreign_key "suggestions", "users"
  add_foreign_key "trainer_reviews", "agents"
  add_foreign_key "trainer_reviews", "reviews"
  add_foreign_key "trainer_reviews", "trainers"
  add_foreign_key "trainers", "agents"
  add_foreign_key "training_records", "agents"
  add_foreign_key "training_records", "trainers"
  add_foreign_key "training_records", "trainings"
  add_foreign_key "user_addresses", "addresses"
  add_foreign_key "user_addresses", "users"
  add_foreign_key "user_contacts", "contacts"
  add_foreign_key "user_contacts", "users"
  add_foreign_key "user_favorites", "properties"
  add_foreign_key "user_favorites", "users"
  add_foreign_key "user_reviews", "agents"
  add_foreign_key "user_reviews", "appointments"
  add_foreign_key "user_reviews", "reviews"
  add_foreign_key "user_reviews", "users"
  add_foreign_key "user_searches", "users"
  add_foreign_key "user_views", "properties"
  add_foreign_key "user_views", "users"
end
