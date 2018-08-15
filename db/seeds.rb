# frozen_string_literal: true

require 'ffaker'

prng = Random.new

10.times do
  Author.create!(firstname: FFaker::Name.first_name, lastname: FFaker::Name.last_name, biography: FFaker::Lorem.word)
end

10.times do
  Book.create!(title: FFaker::Book.title, description: FFaker::Book.description, \
               price: prng.rand(100), quantity: prng.rand(100), materials: FFaker::Book.isbn, \
               dimensions: { height: prng.rand(0..20), width: prng.rand(0..20), depth: prng.rand(0..20) }, \
               published_at: prng.rand(2000..2018))
end

10.times do
  Category.create!(title: FFaker::Book.genre)
end

Category.all.each do |category|
  prng.rand(1..5).times do
    category.books << Book.all[prng.rand(0..9)]
    category.save!
  end
end

5.times { User.create!(email: FFaker::Internet.email, password: FFaker::Internet.password) }

Book.all.each do |book|
  prng.rand(1..5).times do
    book.reviews.new(title: FFaker::Company.position, comment: FFaker::Company.catch_phrase, \
                     rating: prng.rand(0..10), status: Review.statuses[:unprocessed], user_id: prng.rand(1..5)).save!
  end
end

10.times { Country.create!(name: FFaker::Address.country, phone_code: FFaker::PhoneNumber.phone_calling_code) }

User.first.create_billing_address(firstname: 'Alex', lastname: 'Doe', address: 'kirova', \
                                  city: 'dnipro', zip: FFaker::Address.zip_code, phone: '+380972293095', country_id: 1)
User.first.create_shipping_address(firstname: 'Nikita', lastname: 'John', address: 'pobeda', \
                                   city: 'kiev', zip: FFaker::Address.zip_code, phone: '+380675423870', country_id: 1)

# 5.times { Order.create(total_price: prng.rand(10..100), state: 'in progress', \
# user_id: prng.rand(1..5), credit_card_id: 1) }

# CreditCard.create(number: '4142514219000478', card_owner: 'Alex Don', cvv_code: 0o75, \
# expiry_date: '05/21', user_id: 1, order_id: 1)
# User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
# User.all.each do |user|
#   prng.rand(1..5).times { user.create_picture(file: FFaker::Avatar.image) }
# end
user = User.create!(email: 'alex@gmail.com', password: '123456', admin: true)
user.avatar.attach(io: File.open(Rails.root.join('app/assets/images', 'avatar.jpg')), \
                   filename: 'avatar.jpg', content_type: 'image/jpg')
