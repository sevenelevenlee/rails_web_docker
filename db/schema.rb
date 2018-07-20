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

ActiveRecord::Schema.define(version: 20180622033220) do

  create_table "alerts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci ROW_FORMAT=DYNAMIC" do |t|
    t.string "relateable_type"
    t.bigint "relateable_id"
    t.string "sendable_type"
    t.bigint "sendable_id"
    t.string "receiveable_type"
    t.bigint "receiveable_id"
    t.text "content", limit: 16777215
    t.integer "target_type"
    t.string "target_name"
    t.integer "active", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiveable_type", "receiveable_id"], name: "index_alerts_on_receiveable_type_and_receiveable_id"
    t.index ["relateable_type", "relateable_id"], name: "index_alerts_on_relateable_type_and_relateable_id"
    t.index ["sendable_type", "sendable_id"], name: "index_alerts_on_sendable_type_and_sendable_id"
  end

  create_table "audits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci ROW_FORMAT=DYNAMIC" do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.text "audited_changes", limit: 16777215
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_type", "associated_id"], name: "associated_index"
    t.index ["auditable_type", "auditable_id"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "category_id"
    t.string "name"
    t.text "description", limit: 16777215
    t.string "icon"
    t.string "score"
    t.integer "active", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "latitude", precision: 15, scale: 10
    t.decimal "longitude", precision: 15, scale: 10
    t.index ["category_id"], name: "index_brands_on_category_id"
  end

  create_table "businesses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "category_id"
    t.string "name"
    t.text "description", limit: 16777215
    t.string "icon"
    t.string "qualification"
    t.string "score"
    t.integer "active", default: 0
    t.string "province"
    t.string "city"
    t.string "district"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "latitude", precision: 15, scale: 10
    t.decimal "longitude", precision: 15, scale: 10
    t.index ["category_id"], name: "index_businesses_on_category_id"
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci ROW_FORMAT=DYNAMIC" do |t|
    t.string "name"
    t.integer "parent_id"
    t.integer "lft", null: false
    t.integer "rgt", null: false
    t.integer "depth", default: 0, null: false
    t.integer "children_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lft"], name: "index_categories_on_lft"
    t.index ["parent_id"], name: "index_categories_on_parent_id"
    t.index ["rgt"], name: "index_categories_on_rgt"
  end

  create_table "ckeditor_assets", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci" do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "receipt_id"
    t.bigint "user_id"
    t.integer "parent_id"
    t.integer "lft", null: false
    t.integer "rgt", null: false
    t.integer "depth", default: 0, null: false
    t.integer "children_count", default: 0, null: false
    t.text "content", limit: 16777215
    t.string "name"
    t.integer "active", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lft"], name: "index_comments_on_lft"
    t.index ["parent_id"], name: "index_comments_on_parent_id"
    t.index ["receipt_id"], name: "index_comments_on_receipt_id"
    t.index ["rgt"], name: "index_comments_on_rgt"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "communications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "receipt_id"
    t.string "ownable_type"
    t.bigint "ownable_id"
    t.text "content", limit: 16777215
    t.integer "state"
    t.integer "active", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ownable_type", "ownable_id"], name: "index_communications_on_ownable_type_and_ownable_id"
    t.index ["receipt_id"], name: "index_communications_on_receipt_id"
  end

  create_table "exception_tracks", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci" do |t|
    t.string "title"
    t.text "body", limit: 4294967295
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "green_scans", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci" do |t|
    t.bigint "receipt_id"
    t.string "request_id"
    t.text "data_content"
    t.integer "scan_type"
    t.integer "active", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receipt_id"], name: "index_green_scans_on_receipt_id"
  end

  create_table "institutions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "category_id"
    t.integer "parent_id"
    t.integer "lft", null: false
    t.integer "rgt", null: false
    t.integer "depth", default: 0, null: false
    t.integer "children_count", default: 0, null: false
    t.string "name"
    t.string "note"
    t.text "description", limit: 16777215
    t.string "icon"
    t.string "score"
    t.integer "active", default: 0
    t.string "province"
    t.string "city"
    t.string "district"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "latitude", precision: 15, scale: 10
    t.decimal "longitude", precision: 15, scale: 10
    t.index ["category_id"], name: "index_institutions_on_category_id"
    t.index ["lft"], name: "index_institutions_on_lft"
    t.index ["parent_id"], name: "index_institutions_on_parent_id"
    t.index ["rgt"], name: "index_institutions_on_rgt"
  end

  create_table "institutions_keywords", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "keyword_id"
    t.bigint "institution_id"
    t.index ["institution_id"], name: "index_institutions_keywords_on_institution_id"
    t.index ["keyword_id"], name: "index_institutions_keywords_on_keyword_id"
  end

  create_table "keyword_receipts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "receipt_id"
    t.bigint "keyword_id"
    t.string "score"
    t.index ["keyword_id"], name: "index_keyword_receipts_on_keyword_id"
    t.index ["receipt_id"], name: "index_keyword_receipts_on_receipt_id"
  end

  create_table "keywords", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "category_id"
    t.string "name"
    t.integer "state"
    t.string "score"
    t.string "note"
    t.integer "active", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_keywords_on_category_id"
  end

  create_table "member_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "business_id"
    t.string "name"
    t.integer "active", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_id"], name: "index_member_categories_on_business_id"
  end

  create_table "members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "business_id"
    t.bigint "member_category_id"
    t.string "name"
    t.text "description", limit: 16777215
    t.string "icon"
    t.string "score"
    t.integer "active", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_id"], name: "index_members_on_business_id"
    t.index ["member_category_id"], name: "index_members_on_member_category_id"
  end

  create_table "notices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci ROW_FORMAT=DYNAMIC" do |t|
    t.string "relateable_type"
    t.bigint "relateable_id"
    t.string "sendable_type"
    t.bigint "sendable_id"
    t.string "receiveable_type"
    t.bigint "receiveable_id"
    t.string "name"
    t.text "content", limit: 16777215
    t.integer "active", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiveable_type", "receiveable_id"], name: "index_notices_on_receiveable_type_and_receiveable_id"
    t.index ["relateable_type", "relateable_id"], name: "index_notices_on_relateable_type_and_relateable_id"
    t.index ["sendable_type", "sendable_id"], name: "index_notices_on_sendable_type_and_sendable_id"
  end

  create_table "permissions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci ROW_FORMAT=DYNAMIC" do |t|
    t.string "resource_name"
    t.string "resource_action"
    t.string "resource_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "permissions_roles", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "permission_id"
    t.bigint "role_id"
    t.index ["permission_id"], name: "index_permissions_roles_on_permission_id"
    t.index ["role_id"], name: "index_permissions_roles_on_role_id"
  end

  create_table "positions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci ROW_FORMAT=DYNAMIC" do |t|
    t.string "content_uuid"
    t.integer "order"
    t.string "name"
    t.string "note"
    t.integer "active", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "brand_id"
    t.string "name"
    t.integer "active", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_product_categories_on_brand_id"
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "brand_id"
    t.bigint "product_category_id"
    t.string "name"
    t.text "description", limit: 16777215
    t.string "icon"
    t.string "score"
    t.integer "active", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
  end

  create_table "provider_auths", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci ROW_FORMAT=DYNAMIC" do |t|
    t.string "ownable_type"
    t.bigint "ownable_id"
    t.integer "identity_type"
    t.string "identifier"
    t.string "credential"
    t.integer "active", default: 0
    t.text "note"
    t.string "icon"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ownable_type", "ownable_id"], name: "index_provider_auths_on_ownable_type_and_ownable_id"
  end

  create_table "receipt_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "receipt_id"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sort"
    t.integer "active", default: 0
    t.string "scan_request_id"
    t.string "scan_task_id"
    t.text "scan_results"
    t.integer "scan_suggestion", default: 0
    t.index ["receipt_id"], name: "index_receipt_images_on_receipt_id"
  end

  create_table "receipt_videos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci" do |t|
    t.bigint "receipt_id"
    t.string "video"
    t.integer "sort"
    t.integer "active", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "scan_request_id"
    t.string "scan_task_id"
    t.text "scan_results"
    t.integer "scan_suggestion", default: 0
    t.index ["receipt_id"], name: "index_receipt_videos_on_receipt_id"
  end

  create_table "receipts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "user_id"
    t.string "brandable_type"
    t.bigint "brandable_id"
    t.string "productable_type"
    t.bigint "productable_id"
    t.string "type"
    t.string "uuid"
    t.string "title"
    t.string "requirement"
    t.text "content", limit: 16777215
    t.integer "private", default: 0
    t.integer "state"
    t.integer "target"
    t.integer "active", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "scan_suggestion", default: 0
    t.index ["brandable_type", "brandable_id"], name: "index_receipts_on_brandable_type_and_brandable_id"
    t.index ["productable_type", "productable_id"], name: "index_receipts_on_productable_type_and_productable_id"
    t.index ["user_id"], name: "index_receipts_on_user_id"
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci ROW_FORMAT=DYNAMIC" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "supports", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "receipt_id"
    t.bigint "user_id"
    t.integer "active", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receipt_id"], name: "index_supports_on_receipt_id"
    t.index ["user_id"], name: "index_supports_on_user_id"
  end

  create_table "thumbs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "comment_id"
    t.bigint "user_id"
    t.integer "active", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_thumbs_on_comment_id"
    t.index ["user_id"], name: "index_thumbs_on_user_id"
  end

  create_table "user_jobs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci ROW_FORMAT=DYNAMIC" do |t|
    t.string "name"
    t.integer "active", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci ROW_FORMAT=DYNAMIC" do |t|
    t.string "name"
    t.string "phone"
    t.integer "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.bigint "business_id"
    t.bigint "brand_id"
    t.bigint "institution_id"
    t.bigint "user_job_id"
    t.string "real_name"
    t.string "idnum"
    t.string "uuid"
    t.string "icon"
    t.string "score"
    t.integer "active", default: 0
    t.datetime "birthday"
    t.integer "gender", default: 0
    t.string "province"
    t.string "city"
    t.string "district"
    t.string "address"
    t.string "provider"
    t.string "uid"
    t.string "authentication_token"
    t.decimal "latitude", precision: 15, scale: 10
    t.decimal "longitude", precision: 15, scale: 10
    t.index ["brand_id"], name: "index_users_on_brand_id"
    t.index ["business_id"], name: "index_users_on_business_id"
    t.index ["institution_id"], name: "index_users_on_institution_id"
    t.index ["user_job_id"], name: "index_users_on_user_job_id"
  end

  create_table "users_roles", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "verify_codes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci" do |t|
    t.integer "active", default: 0
    t.string "name"
    t.string "code"
    t.string "content"
    t.string "uuid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "brands", "categories"
  add_foreign_key "businesses", "categories"
  add_foreign_key "comments", "receipts"
  add_foreign_key "comments", "users"
  add_foreign_key "communications", "receipts"
  add_foreign_key "green_scans", "receipts"
  add_foreign_key "institutions", "categories"
  add_foreign_key "institutions_keywords", "institutions"
  add_foreign_key "institutions_keywords", "keywords"
  add_foreign_key "keyword_receipts", "keywords"
  add_foreign_key "keyword_receipts", "receipts"
  add_foreign_key "keywords", "categories"
  add_foreign_key "member_categories", "businesses"
  add_foreign_key "members", "businesses"
  add_foreign_key "members", "member_categories"
  add_foreign_key "product_categories", "brands"
  add_foreign_key "products", "brands"
  add_foreign_key "products", "product_categories"
  add_foreign_key "receipt_images", "receipts"
  add_foreign_key "receipt_videos", "receipts"
  add_foreign_key "receipts", "users"
  add_foreign_key "supports", "receipts"
  add_foreign_key "supports", "users"
  add_foreign_key "thumbs", "comments"
  add_foreign_key "thumbs", "users"
  add_foreign_key "users", "brands"
  add_foreign_key "users", "businesses"
  add_foreign_key "users", "institutions"
  add_foreign_key "users", "user_jobs"
end
