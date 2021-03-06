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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140510191946) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "base_urls", force: true do |t|
    t.string   "url"
    t.integer  "season_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "base_urls", ["season_id"], name: "index_base_urls_on_season_id", using: :btree

  create_table "dead_links", force: true do |t|
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "download_links", force: true do |t|
    t.string   "url"
    t.integer  "file_size"
    t.integer  "episode_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "download_links", ["episode_id"], name: "index_download_links_on_episode_id", using: :btree

  create_table "episodes", force: true do |t|
    t.integer  "episode_number"
    t.integer  "season_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "download_count"
  end

  add_index "episodes", ["episode_number"], name: "index_episodes_on_episode_number", using: :btree
  add_index "episodes", ["season_id"], name: "index_episodes_on_season_id", using: :btree

  create_table "movies", force: true do |t|
    t.string   "title"
    t.integer  "tmdb_id"
    t.string   "poster"
    t.string   "backdrop"
    t.date     "release_date"
    t.string   "download_link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.integer  "download_count"
    t.integer  "file_size"
    t.tsvector "tsv"
    t.string   "genres",            array: true
    t.string   "imdb_id"
    t.text     "magnetic_link"
    t.string   "torrent_file_link"
    t.float    "imdb_rating"
    t.string   "similar_movies",    array: true
    t.string   "subtitle_url"
  end

  add_index "movies", ["imdb_rating", "genres", "release_date"], name: "index_movies_on_imdb_rating_and_genres_and_release_date", using: :btree
  add_index "movies", ["similar_movies"], name: "index_movies_on_similar_movies", using: :btree
  add_index "movies", ["slug"], name: "index_movies_on_slug", unique: true, using: :btree
  add_index "movies", ["tmdb_id"], name: "index_movies_on_tmdb_id", unique: true, using: :btree
  add_index "movies", ["tsv"], name: "movies_tsv_idx", using: :gin

  create_table "searches", force: true do |t|
    t.string   "title"
    t.string   "year"
    t.string   "genre"
    t.float    "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seasons", force: true do |t|
    t.integer  "season_number"
    t.integer  "tv_show_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "seasons", ["season_number"], name: "index_seasons_on_season_number", using: :btree
  add_index "seasons", ["tv_show_id"], name: "index_seasons_on_tv_show_id", using: :btree

  create_table "tv_shows", force: true do |t|
    t.string   "name"
    t.integer  "tmdb_id"
    t.string   "poster"
    t.string   "backdrop"
    t.date     "release_date"
    t.integer  "number_of_episodes"
    t.integer  "number_of_seasons"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.tsvector "tsv"
  end

  add_index "tv_shows", ["slug"], name: "index_tv_shows_on_slug", unique: true, using: :btree
  add_index "tv_shows", ["tmdb_id"], name: "index_tv_shows_on_tmdb_id", unique: true, using: :btree
  add_index "tv_shows", ["tsv"], name: "tv_shows_tsv_idx", using: :gin

end
