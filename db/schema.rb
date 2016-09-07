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

ActiveRecord::Schema.define(version: 20160905135311) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "event_errors", force: :cascade do |t|
    t.uuid     "uuid",         default: -> { "uuid_generate_v4()" }, null: false
    t.string   "error_type"
    t.string   "sender"
    t.string   "message"
    t.datetime "published_at"
    t.json     "debug_data"
    t.integer  "event_id"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.index ["event_id"], name: "index_event_errors_on_event_id", using: :btree
  end

  create_table "event_errors_messages", id: false, force: :cascade do |t|
    t.integer "event_error_id"
    t.integer "message_id"
    t.index ["event_error_id"], name: "index_event_errors_messages_on_event_error_id", using: :btree
    t.index ["message_id"], name: "index_event_errors_messages_on_message_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.uuid     "uuid",         default: -> { "uuid_generate_v4()" }, null: false
    t.string   "event_name"
    t.datetime "published_at"
    t.string   "sender_id"
    t.json     "data"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "raw_content"
    t.integer  "event_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["event_id"], name: "index_messages_on_event_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
