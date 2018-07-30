# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_180_730_131_314) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'addresses', force: :cascade do |t|
    t.string 'firstname'
    t.string 'lastname'
    t.string 'address'
    t.string 'city'
    t.string 'zip'
    t.string 'phone'
    t.string 'address_type'
    t.string 'addressable_type'
    t.bigint 'addressable_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'country_id'
    t.index %w[addressable_type addressable_id], name: 'index_addresses_on_addressable_type_and_addressable_id'
    t.index ['country_id'], name: 'index_addresses_on_country_id'
  end

  create_table 'author_books', force: :cascade do |t|
    t.bigint 'author_id'
    t.bigint 'book_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['author_id'], name: 'index_author_books_on_author_id'
    t.index ['book_id'], name: 'index_author_books_on_book_id'
  end

  create_table 'authors', force: :cascade do |t|
    t.string 'firstname'
    t.string 'lastname'
    t.text 'biography'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'book_categories', force: :cascade do |t|
    t.bigint 'book_id'
    t.bigint 'category_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['book_id'], name: 'index_book_categories_on_book_id'
    t.index ['category_id'], name: 'index_book_categories_on_category_id'
  end

  create_table 'books', force: :cascade do |t|
    t.string 'title'
    t.text 'description'
    t.decimal 'price', precision: 6, scale: 2
    t.integer 'quantity'
    t.string 'materials'
    t.string 'dimensions'
    t.integer 'published_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'title'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'countries', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'credit_cards', force: :cascade do |t|
    t.string 'number'
    t.string 'card_owner'
    t.integer 'cvv_code'
    t.string 'expiry_date'
    t.bigint 'user_id'
    t.bigint 'order_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['order_id'], name: 'index_credit_cards_on_order_id'
    t.index ['user_id'], name: 'index_credit_cards_on_user_id'
  end

  create_table 'order_items', force: :cascade do |t|
    t.decimal 'price', precision: 8, scale: 2
    t.integer 'quantity'
    t.bigint 'book_id'
    t.bigint 'order_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['book_id'], name: 'index_order_items_on_book_id'
    t.index ['order_id'], name: 'index_order_items_on_order_id'
  end

  create_table 'orders', force: :cascade do |t|
    t.decimal 'total_price', precision: 10, scale: 2
    t.string 'state'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'credit_card_id'
    t.index ['credit_card_id'], name: 'index_orders_on_credit_card_id'
    t.index ['user_id'], name: 'index_orders_on_user_id'
  end

  create_table 'pictures', force: :cascade do |t|
    t.string 'imageable_type'
    t.bigint 'imageable_id'
    t.string 'file'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[imageable_type imageable_id], name: 'index_pictures_on_imageable_type_and_imageable_id'
  end

  create_table 'reviews', force: :cascade do |t|
    t.string 'title'
    t.text 'comment'
    t.integer 'rating'
    t.bigint 'book_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'user_id'
    t.index ['book_id'], name: 'index_reviews_on_book_id'
    t.index ['user_id'], name: 'index_reviews_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.inet 'current_sign_in_ip'
    t.inet 'last_sign_in_ip'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['confirmation_token'], name: 'index_users_on_confirmation_token', unique: true
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'addresses', 'countries'
  add_foreign_key 'author_books', 'authors'
  add_foreign_key 'author_books', 'books'
  add_foreign_key 'book_categories', 'books'
  add_foreign_key 'book_categories', 'categories'
  add_foreign_key 'credit_cards', 'orders'
  add_foreign_key 'credit_cards', 'users'
  add_foreign_key 'orders', 'credit_cards'
  add_foreign_key 'orders', 'users'
  add_foreign_key 'reviews', 'books'
  add_foreign_key 'reviews', 'users'
end
