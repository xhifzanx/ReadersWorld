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

ActiveRecord::Schema.define(version: 2023_03_10_123253) do

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

# Could not dump table "chapters" because of following StandardError
#   Unknown type '' for column 'manga_id'

  create_table "comment_chapters", force: :cascade do |t|
    t.text "message"
    t.integer "chapter_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chapter_id"], name: "index_comment_chapters_on_chapter_id"
    t.index ["user_id"], name: "index_comment_chapters_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "message"
    t.integer "user_id", null: false
    t.integer "manga_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["manga_id"], name: "index_comments_on_manga_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "mangas", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "chapter_numbers"
    t.integer "views"
    t.integer "number_of_bookmarked"
    t.integer "status"
    t.datetime "last_update"
    t.string "author"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "thumbnail"
    t.boolean "bookmarked"
    t.integer "likes"
    t.string "categories"
    t.integer "category_id"
  end

  create_table "mangas_users", id: false, force: :cascade do |t|
    t.integer "manga_id", null: false
    t.integer "user_id", null: false
    t.index ["manga_id", "user_id"], name: "index_mangas_users_on_manga_id_and_user_id"
    t.index ["user_id", "manga_id"], name: "index_mangas_users_on_user_id_and_manga_id"
  end

  create_table "replies", force: :cascade do |t|
    t.text "reply_message"
    t.integer "comment_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["comment_id"], name: "index_replies_on_comment_id"
    t.index ["user_id"], name: "index_replies_on_user_id"
  end

  create_table "reply_chapters", force: :cascade do |t|
    t.text "reply_message"
    t.integer "comment_chapter_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["comment_chapter_id"], name: "index_reply_chapters_on_comment_chapter_id"
    t.index ["user_id"], name: "index_reply_chapters_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.integer "number_of_bookmarks"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comment_chapters", "chapters"
  add_foreign_key "comment_chapters", "users"
  add_foreign_key "comments", "mangas"
  add_foreign_key "comments", "users"
  add_foreign_key "replies", "comments"
  add_foreign_key "replies", "users"
  add_foreign_key "reply_chapters", "comment_chapters"
  add_foreign_key "reply_chapters", "users"
end
