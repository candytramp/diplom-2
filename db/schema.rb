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

ActiveRecord::Schema.define(version: 20150602071802) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "article_authors", force: :cascade do |t|
    t.integer  "article_id",                 null: false
    t.integer  "person_id",                  null: false
    t.string   "old_lastname",    limit: 64, null: false
    t.boolean  "is_teacher"
    t.boolean  "is_staffteacher"
    t.boolean  "is_student"
    t.boolean  "is_postgrad"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "article_authors", ["article_id", "person_id"], name: "index_article_authors_on_article_id_and_person_id", unique: true, using: :btree
  add_index "article_authors", ["article_id"], name: "index_article_authors_on_article_id", using: :btree
  add_index "article_authors", ["person_id"], name: "index_article_authors_on_person_id", using: :btree

  create_table "articles", force: :cascade do |t|
    t.text     "name",          null: false
    t.text     "source"
    t.integer  "start_page",    null: false
    t.integer  "finish_page",   null: false
    t.text     "link"
    t.integer  "year",          null: false
    t.string   "creator_login"
    t.text     "creator_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["name"], name: "index_articles_on_name", unique: true, using: :btree

  create_table "author_monographs", force: :cascade do |t|
    t.integer  "monograph_id",    null: false
    t.integer  "person_id",       null: false
    t.string   "old_lastname",    null: false
    t.boolean  "is_teacher"
    t.boolean  "is_staffteacher"
    t.boolean  "is_student"
    t.boolean  "is_postgrad"
    t.text     "details"
    t.integer  "pages",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "author_monographs", ["monograph_id", "person_id"], name: "index_author_monographs_on_monograph_id_and_person_id", unique: true, using: :btree
  add_index "author_monographs", ["monograph_id"], name: "index_author_monographs_on_monograph_id", using: :btree
  add_index "author_monographs", ["person_id"], name: "index_author_monographs_on_person_id", using: :btree

  create_table "author_requests", force: :cascade do |t|
    t.integer  "ois_request_id",  null: false
    t.integer  "person_id",       null: false
    t.string   "old_lastname",    null: false
    t.boolean  "is_teacher"
    t.boolean  "is_staffteacher"
    t.boolean  "is_student"
    t.boolean  "is_postgrad"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "author_requests", ["ois_request_id", "person_id"], name: "index_author_requests_on_ois_request_id_and_person_id", unique: true, using: :btree
  add_index "author_requests", ["ois_request_id"], name: "index_author_requests_on_ois_request_id", using: :btree
  add_index "author_requests", ["person_id"], name: "index_author_requests_on_person_id", using: :btree

  create_table "conference_people", force: :cascade do |t|
    t.integer  "conference_id",   null: false
    t.integer  "person_id",       null: false
    t.string   "old_lastname",    null: false
    t.boolean  "is_teacher"
    t.boolean  "is_staffteacher"
    t.boolean  "is_student"
    t.boolean  "is_postgrad"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "conference_people", ["conference_id", "person_id"], name: "index_conference_people_on_conference_id_and_person_id", unique: true, using: :btree
  add_index "conference_people", ["conference_id"], name: "index_conference_people_on_conference_id", using: :btree
  add_index "conference_people", ["person_id"], name: "index_conference_people_on_person_id", using: :btree

  create_table "conferences", force: :cascade do |t|
    t.text     "name",          null: false
    t.text     "country"
    t.text     "city"
    t.date     "start"
    t.date     "finish"
    t.integer  "year",          null: false
    t.text     "ctype",         null: false
    t.string   "creator_login"
    t.text     "creator_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "diploma_people", force: :cascade do |t|
    t.integer  "diploma_id",      null: false
    t.integer  "person_id",       null: false
    t.string   "old_lastname",    null: false
    t.boolean  "is_teacher"
    t.boolean  "is_staffteacher"
    t.boolean  "is_student"
    t.boolean  "is_postgrad"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "diploma_people", ["diploma_id", "person_id"], name: "index_diploma_people_on_diploma_id_and_person_id", unique: true, using: :btree
  add_index "diploma_people", ["diploma_id"], name: "index_diploma_people_on_diploma_id", using: :btree
  add_index "diploma_people", ["person_id"], name: "index_diploma_people_on_person_id", using: :btree

  create_table "diplomas", force: :cascade do |t|
    t.text     "name",               null: false
    t.date     "issue_date"
    t.text     "issue_organization"
    t.integer  "year",               null: false
    t.string   "creator_login"
    t.text     "creator_data"
    t.integer  "reward_id"
    t.string   "reward_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "diplomas", ["reward_type", "reward_id"], name: "index_diplomas_on_reward_type_and_reward_id", using: :btree

  create_table "documents", force: :cascade do |t|
    t.text     "description"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "creator_login"
    t.text     "creator_data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "paper_file_name"
    t.string   "paper_content_type"
    t.integer  "paper_file_size"
    t.datetime "paper_updated_at"
    t.integer  "page_number"
  end

  add_index "documents", ["owner_type", "owner_id"], name: "index_documents_on_owner_type_and_owner_id", using: :btree

  create_table "exhibit_people", force: :cascade do |t|
    t.integer  "exhibit_id",      null: false
    t.integer  "person_id",       null: false
    t.string   "old_lastname",    null: false
    t.boolean  "is_teacher"
    t.boolean  "is_staffteacher"
    t.boolean  "is_student"
    t.boolean  "is_postgrad"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exhibit_people", ["exhibit_id", "person_id"], name: "index_exhibit_people_on_exhibit_id_and_person_id", unique: true, using: :btree
  add_index "exhibit_people", ["exhibit_id"], name: "index_exhibit_people_on_exhibit_id", using: :btree
  add_index "exhibit_people", ["person_id"], name: "index_exhibit_people_on_person_id", using: :btree

  create_table "exhibition_people", force: :cascade do |t|
    t.integer  "exhibition_id",   null: false
    t.integer  "person_id",       null: false
    t.string   "old_lastname",    null: false
    t.boolean  "is_teacher"
    t.boolean  "is_staffteacher"
    t.boolean  "is_student"
    t.boolean  "is_postgrad"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exhibition_people", ["exhibition_id", "person_id"], name: "index_exhibition_people_on_exhibition_id_and_person_id", unique: true, using: :btree
  add_index "exhibition_people", ["exhibition_id"], name: "index_exhibition_people_on_exhibition_id", using: :btree
  add_index "exhibition_people", ["person_id"], name: "index_exhibition_people_on_person_id", using: :btree

  create_table "exhibitions", force: :cascade do |t|
    t.text     "name",          null: false
    t.text     "etype",         null: false
    t.text     "country"
    t.text     "city"
    t.date     "start"
    t.date     "finish"
    t.integer  "year",          null: false
    t.string   "creator_login"
    t.text     "creator_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exhibitions", ["year", "name"], name: "index_exhibitions_on_year_and_name", unique: true, using: :btree

  create_table "exhibits", force: :cascade do |t|
    t.text     "name",          null: false
    t.integer  "year",          null: false
    t.integer  "exhibition_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exhibits", ["exhibition_id"], name: "index_exhibits_on_exhibition_id", using: :btree

  create_table "fields", force: :cascade do |t|
    t.text     "name",                 null: false
    t.string   "code",       limit: 8, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fields", ["code"], name: "index_fields_on_code", unique: true, using: :btree

  create_table "grntis", force: :cascade do |t|
    t.string   "grnti",      limit: 8, null: false
    t.text     "name",                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "grntis", ["grnti"], name: "index_grntis_on_grnti", unique: true, using: :btree

  create_table "licence_people", force: :cascade do |t|
    t.integer  "licence_id",      null: false
    t.integer  "person_id",       null: false
    t.string   "old_lastname",    null: false
    t.boolean  "is_teacher"
    t.boolean  "is_staffteacher"
    t.boolean  "is_student"
    t.boolean  "is_postgrad"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "licence_people", ["licence_id", "person_id"], name: "index_licence_people_on_licence_id_and_person_id", unique: true, using: :btree
  add_index "licence_people", ["licence_id"], name: "index_licence_people_on_licence_id", using: :btree
  add_index "licence_people", ["person_id"], name: "index_licence_people_on_person_id", using: :btree

  create_table "licences", force: :cascade do |t|
    t.string   "number",             limit: 16, null: false
    t.date     "reg_date",                      null: false
    t.string   "ltype",              limit: 32, null: false
    t.text     "name",                          null: false
    t.date     "expiration_date"
    t.string   "req_number"
    t.text     "req_author"
    t.text     "req_object"
    t.string   "req_status"
    t.string   "reg_agency"
    t.date     "req_priority"
    t.string   "support"
    t.integer  "research_effort_id"
    t.string   "creator_login"
    t.text     "creator_data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ois_request_id"
  end

  add_index "licences", ["ois_request_id"], name: "index_licences_on_ois_request_id", using: :btree
  add_index "licences", ["research_effort_id"], name: "index_licences_on_research_effort_id", using: :btree

  create_table "monographs", force: :cascade do |t|
    t.string   "isbn",           limit: 32,                         null: false
    t.text     "name",                                              null: false
    t.text     "publisher",                                         null: false
    t.text     "publisher_name"
    t.integer  "publish_year",                                      null: false
    t.decimal  "pages",                     precision: 5, scale: 2, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nir_types", force: :cascade do |t|
    t.string   "name",       limit: 30, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "nir_types", ["name"], name: "index_nir_types_on_name", unique: true, using: :btree

  create_table "ois_requests", force: :cascade do |t|
    t.string   "number",                                    null: false
    t.date     "priority",                                  null: false
    t.text     "author",                                    null: false
    t.text     "name",                                      null: false
    t.text     "object",                                    null: false
    t.string   "reg_agency",                                null: false
    t.integer  "research_effort_id"
    t.string   "status",             default: "российская", null: false
    t.string   "creator_login"
    t.text     "creator_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ois_requests", ["research_effort_id"], name: "index_ois_requests_on_research_effort_id", using: :btree

  create_table "people", force: :cascade do |t|
    t.string   "last_name",    limit: 64, null: false
    t.string   "first_name",   limit: 64, null: false
    t.string   "second_name",  limit: 64
    t.text     "external_ids"
    t.date     "birthday"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people_reports", force: :cascade do |t|
    t.integer  "report_id",       null: false
    t.integer  "person_id",       null: false
    t.string   "old_lastname",    null: false
    t.boolean  "is_teacher"
    t.boolean  "is_staffteacher"
    t.boolean  "is_student"
    t.boolean  "is_postgrad"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "people_reports", ["person_id"], name: "index_people_reports_on_person_id", using: :btree
  add_index "people_reports", ["report_id", "person_id"], name: "index_people_reports_on_report_id_and_person_id", unique: true, using: :btree
  add_index "people_reports", ["report_id"], name: "index_people_reports_on_report_id", using: :btree

  create_table "people_research_efforts", force: :cascade do |t|
    t.integer  "research_effort_id", null: false
    t.integer  "person_id",          null: false
    t.string   "old_lastname",       null: false
    t.boolean  "is_teacher"
    t.boolean  "is_staffteacher"
    t.boolean  "is_student"
    t.boolean  "is_postgrad"
    t.text     "details"
    t.decimal  "person_value",       null: false
    t.text     "role",               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "people_research_efforts", ["person_id"], name: "index_people_research_efforts_on_person_id", using: :btree
  add_index "people_research_efforts", ["research_effort_id", "person_id"], name: "effort_person", unique: true, using: :btree
  add_index "people_research_efforts", ["research_effort_id"], name: "index_people_research_efforts_on_research_effort_id", using: :btree

  create_table "people_textbooks", force: :cascade do |t|
    t.integer  "textbook_id",     null: false
    t.integer  "person_id",       null: false
    t.string   "old_lastname",    null: false
    t.boolean  "is_teacher"
    t.boolean  "is_staffteacher"
    t.boolean  "is_student"
    t.boolean  "is_postgrad"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "people_textbooks", ["person_id"], name: "index_people_textbooks_on_person_id", using: :btree
  add_index "people_textbooks", ["textbook_id", "person_id"], name: "index_people_textbooks_on_textbook_id_and_person_id", unique: true, using: :btree
  add_index "people_textbooks", ["textbook_id"], name: "index_people_textbooks_on_textbook_id", using: :btree

  create_table "reports", force: :cascade do |t|
    t.text     "title"
    t.integer  "conference_id", null: false
    t.string   "creator_login"
    t.text     "creator_data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "article_id"
  end

  add_index "reports", ["article_id"], name: "index_reports_on_article_id", using: :btree
  add_index "reports", ["conference_id"], name: "index_reports_on_conference_id", using: :btree

  create_table "research_efforts", force: :cascade do |t|
    t.text     "name",                                          null: false
    t.integer  "state_program_id",                              null: false
    t.date     "start_date",                                    null: false
    t.date     "finish_date",                                   null: false
    t.integer  "grnti_id",                                      null: false
    t.integer  "field_id",                                      null: false
    t.decimal  "full_value",           precision: 12, scale: 2
    t.text     "year_value"
    t.string   "state_reg_number"
    t.string   "nir_number"
    t.string   "inventory_number"
    t.integer  "nir_type_id",                                   null: false
    t.integer  "source_id",                                     null: false
    t.integer  "scientific_school_id",                          null: false
    t.boolean  "is_nir",                                        null: false
    t.string   "creator_login"
    t.text     "creator_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "research_efforts", ["field_id"], name: "index_research_efforts_on_field_id", using: :btree
  add_index "research_efforts", ["grnti_id"], name: "index_research_efforts_on_grnti_id", using: :btree
  add_index "research_efforts", ["name"], name: "index_research_efforts_on_name", unique: true, using: :btree
  add_index "research_efforts", ["nir_type_id"], name: "index_research_efforts_on_nir_type_id", using: :btree
  add_index "research_efforts", ["scientific_school_id"], name: "index_research_efforts_on_scientific_school_id", using: :btree
  add_index "research_efforts", ["source_id"], name: "index_research_efforts_on_source_id", using: :btree
  add_index "research_efforts", ["state_program_id"], name: "index_research_efforts_on_state_program_id", using: :btree

  create_table "role_users", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "role_id",    null: false
    t.text     "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "role_users", ["role_id"], name: "index_role_users_on_role_id", using: :btree
  add_index "role_users", ["user_id"], name: "index_role_users_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 32, null: false
    t.text     "info"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "roles", ["name"], name: "index_roles_on_name", unique: true, using: :btree

  create_table "scientific_schools", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scientific_schools", ["name"], name: "index_scientific_schools_on_name", unique: true, using: :btree

  create_table "sources", force: :cascade do |t|
    t.text     "funding_source", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sources", ["funding_source"], name: "index_sources_on_funding_source", unique: true, using: :btree

  create_table "state_programs", force: :cascade do |t|
    t.text     "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "state_programs", ["name"], name: "index_state_programs_on_name", unique: true, using: :btree

  create_table "textbooks", force: :cascade do |t|
    t.string   "isbn",          limit: 32,                         null: false
    t.text     "title",                                            null: false
    t.text     "publisher",                                        null: false
    t.text     "grif",                                             null: false
    t.integer  "publish_year",                                     null: false
    t.decimal  "pages",                    precision: 5, scale: 2, null: false
    t.text     "textbook_type",                                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "theses", force: :cascade do |t|
    t.integer  "person_id",               null: false
    t.text     "speciality",              null: false
    t.text     "council"
    t.text     "theme",                   null: false
    t.string   "ttype",        limit: 32, null: false
    t.integer  "year",                    null: false
    t.text     "in_time"
    t.date     "defence_date",            null: false
    t.string   "council_code", limit: 16
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "theses", ["person_id"], name: "index_theses_on_person_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "login",      limit: 32, null: false
    t.text     "info"
    t.text     "data"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "person_id"
  end

  add_index "users", ["login"], name: "index_users_on_login", unique: true, using: :btree
  add_index "users", ["person_id"], name: "index_users_on_person_id", using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  add_foreign_key "role_users", "roles"
  add_foreign_key "role_users", "users"
end
