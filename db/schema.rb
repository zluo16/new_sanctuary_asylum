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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180218002335) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accompaniment_reports", force: :cascade do |t|
    t.integer  "activity_id", null: false
    t.text     "notes"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  create_table "accompaniments", force: :cascade do |t|
    t.integer "activity_id"
    t.integer "user_id"
    t.text    "availability_notes"
  end

  create_table "activities", force: :cascade do |t|
    t.string   "event"
    t.integer  "location_id"
    t.integer  "friend_id"
    t.integer  "judge_id"
    t.datetime "occur_at"
    t.text     "notes"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "asylum_application_drafts", force: :cascade do |t|
    t.text     "notes"
    t.integer  "friend_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "pdf_draft"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
  end

  create_table "detentions", force: :cascade do |t|
    t.integer  "friend_id",         null: false
    t.date     "date_detained"
    t.integer  "location_id"
    t.text     "notes"
    t.date     "date_released"
    t.string   "case_status"
    t.string   "other_case_status"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "events", force: :cascade do |t|
    t.datetime "date"
    t.integer  "location_id"
    t.string   "title",       default: ""
    t.string   "category"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "friend_event_attendances", force: :cascade do |t|
    t.integer  "friend_id",  null: false
    t.integer  "event_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friend_languages", force: :cascade do |t|
    t.integer  "friend_id",   null: false
    t.integer  "language_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["friend_id"], name: "index_friend_languages_on_friend_id", using: :btree
    t.index ["language_id"], name: "index_friend_languages_on_language_id", using: :btree
  end

  create_table "friends", force: :cascade do |t|
    t.string   "first_name",                                                    null: false
    t.string   "last_name",                                                     null: false
    t.string   "phone"
    t.string   "email"
    t.string   "a_number"
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
    t.string   "middle_name"
    t.boolean  "no_a_number",                                   default: false, null: false
    t.integer  "ethnicity"
    t.string   "other_ethnicity"
    t.integer  "gender"
    t.date     "date_of_birth"
    t.string   "status"
    t.date     "date_of_entry"
    t.text     "notes"
    t.string   "asylum_status"
    t.date     "date_asylum_application_submitted"
    t.text     "lawyer_notes"
    t.string   "work_authorization_status"
    t.date     "date_eligible_to_apply_for_work_authorization"
    t.date     "date_work_authorization_submitted"
    t.text     "work_authorization_notes"
    t.string   "sijs_status"
    t.date     "date_sijs_submitted"
    t.text     "sijs_notes"
    t.text     "asylum_notes"
    t.integer  "country_id"
    t.integer  "lawyer_referred_to"
    t.integer  "lawyer_represented_by"
    t.integer  "sijs_lawyer"
    t.string   "zip_code"
    t.boolean  "visited_the_clinic"
    t.boolean  "criminal_conviction"
    t.text     "criminal_conviction_notes"
    t.boolean  "final_order_of_removal"
    t.boolean  "has_a_lawyer_for_detention"
    t.string   "detention_advocate_contact_name"
    t.string   "detention_advocate_contact_phone"
    t.text     "detention_advocate_contact_notes"
    t.boolean  "bonded_out_by_nsc"
    t.integer  "bond_amount"
    t.datetime "date_bonded_out"
    t.integer  "bonded_out_by"
  end

  create_table "judges", force: :cascade do |t|
    t.text     "first_name"
    t.text     "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
  end

  create_table "lawyers", force: :cascade do |t|
    t.string   "first_name",   null: false
    t.string   "last_name",    null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "email"
    t.string   "organization"
    t.string   "phone_number"
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "old_passwords", force: :cascade do |t|
    t.string   "encrypted_password",       null: false
    t.string   "password_archivable_type", null: false
    t.string   "password_salt"
    t.integer  "password_archivable_id",   null: false
    t.datetime "created_at"
    t.index ["password_archivable_type", "password_archivable_id"], name: "index_password_archivable", using: :btree
  end

  create_table "parent_child_relationships", force: :cascade do |t|
    t.integer  "parent_id",  null: false
    t.integer  "child_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "partner_relationships", force: :cascade do |t|
    t.integer  "friend_id",  null: false
    t.integer  "partner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sanctuaries", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state",               limit: 2
    t.string "zip_code"
    t.string "leader_name"
    t.string "leader_phone_number"
    t.string "leader_email"
  end

  create_table "sibling_relationships", force: :cascade do |t|
    t.integer  "friend_id",  null: false
    t.integer  "sibling_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sijs_application_drafts", force: :cascade do |t|
    t.text     "notes"
    t.integer  "friend_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "pdf_draft",  null: false
  end

  create_table "spousal_relationships", force: :cascade do |t|
    t.integer  "friend_id",  null: false
    t.integer  "spouse_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_asylum_application_draft_associations", force: :cascade do |t|
    t.integer  "user_id",                     null: false
    t.integer  "asylum_application_draft_id", null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "user_event_attendances", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "event_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_friend_associations", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "friend_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_user_friend_associations_on_friend_id", using: :btree
    t.index ["user_id"], name: "index_user_friend_associations_on_user_id", using: :btree
  end

  create_table "user_sijs_application_draft_associations", force: :cascade do |t|
    t.integer  "user_id",                   null: false
    t.integer  "sijs_application_draft_id", null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "role",                              default: 0
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "email",                             default: "",    null: false
    t.string   "encrypted_password",                default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.string   "invited_by_type"
    t.integer  "invited_by_id"
    t.integer  "invitations_count",                 default: 0
    t.integer  "volunteer_type"
    t.boolean  "pledge_signed",                     default: false
    t.string   "unique_session_id",      limit: 20
    t.datetime "password_changed_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
    t.index ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
    t.index ["password_changed_at"], name: "index_users_on_password_changed_at", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
