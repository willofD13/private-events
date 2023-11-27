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

ActiveRecord::Schema[7.1].define(version: 2023_11_27_190419) do
  create_table "event_attendings", force: :cascade do |t|
    t.integer "attended_event_id"
    t.integer "event_attendee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attended_event_id"], name: "index_event_attendings_on_attended_event_id"
    t.index ["event_attendee_id"], name: "index_event_attendings_on_event_attendee_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "date"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "creator_id"
    t.string "title"
    t.text "body"
    t.index ["creator_id"], name: "index_events_on_creator_id"
  end

  create_table "guest_invitings", id: false, force: :cascade do |t|
    t.integer "guesting_invitation_id"
    t.integer "guest_invited_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guest_invited_id"], name: "index_guest_invitings_on_guest_invited_id"
    t.index ["guesting_invitation_id"], name: "index_guest_invitings_on_guesting_invitation_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "event_id"
    t.integer "host_id"
    t.index ["event_id"], name: "index_invitations_on_event_id"
    t.index ["host_id"], name: "index_invitations_on_host_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "event_attendings", "events", column: "attended_event_id"
  add_foreign_key "event_attendings", "users", column: "event_attendee_id"
  add_foreign_key "events", "users", column: "creator_id"
  add_foreign_key "guest_invitings", "invitations", column: "guesting_invitation_id"
  add_foreign_key "guest_invitings", "users", column: "guest_invited_id"
  add_foreign_key "invitations", "events"
  add_foreign_key "invitations", "users", column: "host_id"
end
