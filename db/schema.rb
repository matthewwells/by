# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100126093215) do

  create_table "birders", :force => true do |t|
    t.string   "user_name",       :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "hashed_password"
    t.string   "salt"
    t.string   "email_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "birds", :force => true do |t|
    t.string   "vernacular_name",    :null => false
    t.string   "international_name"
    t.string   "scientific_name"
    t.string   "category"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "follow_requests", :force => true do |t|
    t.integer  "birder_id"
    t.integer  "follower_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "sightings", :force => true do |t|
    t.integer  "birder_id",     :null => false
    t.integer  "bird_id",       :null => false
    t.date     "sighting_date", :null => false
    t.string   "location"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
