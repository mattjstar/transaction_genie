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

ActiveRecord::Schema.define(version: 20160430182016) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "documents", force: :cascade do |t|
    t.string   "document_id_num",     null: false
    t.string   "crfn"
    t.string   "collateral"
    t.integer  "num_pages"
    t.string   "reel_page"
    t.date     "expiration_date"
    t.string   "doc_type"
    t.string   "file_num"
    t.date     "assessment_date"
    t.date     "doc_date"
    t.string   "slid_num"
    t.decimal  "doc_amount"
    t.integer  "borough"
    t.decimal  "percent_transferred"
    t.string   "rptt_num"
    t.string   "map_sequence_num"
    t.string   "message"
    t.text     "remarks"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.datetime "recorded_filed_at"
  end

  add_index "documents", ["document_id_num"], name: "index_documents_on_document_id_num", unique: true, using: :btree

  create_table "documents_parcels", id: false, force: :cascade do |t|
    t.integer  "document_id"
    t.integer  "parcel_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "documents_parcels", ["document_id"], name: "index_documents_parcels_on_document_id", using: :btree
  add_index "documents_parcels", ["parcel_id"], name: "index_documents_parcels_on_parcel_id", using: :btree

  create_table "documents_parties", force: :cascade do |t|
    t.integer  "document_id"
    t.integer  "party_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "party_level"
  end

  add_index "documents_parties", ["document_id"], name: "index_documents_parties_on_document_id", using: :btree
  add_index "documents_parties", ["party_id"], name: "index_documents_parties_on_party_id", using: :btree
  add_index "documents_parties", ["party_level"], name: "index_documents_parties_on_party_level", using: :btree

  create_table "documents_references", id: false, force: :cascade do |t|
    t.integer  "document_id"
    t.integer  "reference_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "documents_references", ["document_id"], name: "index_documents_references_on_document_id", using: :btree
  add_index "documents_references", ["reference_id"], name: "index_documents_references_on_reference_id", using: :btree

  create_table "parcels", force: :cascade do |t|
    t.integer  "borough"
    t.integer  "block"
    t.integer  "lot"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "bbl",                 null: false
    t.string   "partial"
    t.string   "property_type"
    t.boolean  "easement"
    t.boolean  "air_rights"
    t.boolean  "subterranean_rights"
    t.string   "property_address"
    t.string   "unit"
    t.text     "remarks"
  end

  add_index "parcels", ["bbl"], name: "index_parcels_on_bbl", unique: true, using: :btree
  add_index "parcels", ["borough", "block", "lot"], name: "index_parcels_on_borough_block_and_lot", unique: true, using: :btree

  create_table "parties", force: :cascade do |t|
    t.string   "name"
    t.string   "line1"
    t.string   "line2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "parties", ["name"], name: "index_parties_on_name", using: :btree

  create_table "references", force: :cascade do |t|
    t.string   "crfn"
    t.string   "document_id_num"
    t.integer  "borough"
    t.string   "year"
    t.string   "reel"
    t.string   "page"
    t.string   "file_num"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "references", ["crfn", "document_id_num"], name: "index_references_on_crfn_and_document_id_num", unique: true, using: :btree
  add_index "references", ["crfn"], name: "index_references_on_crfn", using: :btree
  add_index "references", ["document_id_num"], name: "index_references_on_document_id_num", using: :btree

end
