# frozen_string_literal: true

require 'ffaker'

prng = Random.new

10.times do
  Author.create(firstname: FFaker::Name.first_name, lastname: FFaker::Name.last_name, biography: FFaker::Lorem.word)
end

10.times do
  Book.create(title: FFaker::Book.title, description: FFaker::Book.description, \
              price: prng.rand(100), quantity: prng.rand(100), materials: FFaker::Book.isbn, \
              dimensions: FFaker::Color.name, published_at: prng.rand(2000..2018))
end

Book.all.each do |book|
  prng.rand(1..5).times { book.pictures.create(file: FFaker::Avatar.image) }
end

10.times do
  Category.create(title: FFaker::Book.genre)
end

Category.all.each do |category|
  prng.rand(1..5).times do
    category.books << Book.all[prng.rand(0..9)]
    category.save!
  end
end

5.times { User.create(email: FFaker::Internet.email, password: FFaker::Internet.password) }

User.all.each do |user|
  prng.rand(1..5).times { user.create_picture(file: FFaker::Avatar.image) }
end

Book.all.each do |book|
  prng.rand(1..5).times do
    book.reviews.new(title: FFaker::Company.position, comment: FFaker::Company.catch_phrase, \
                     rating: prng.rand(0..10), user_id: prng.rand(1..5)).save!
  end
end

10.times { Country.create(name: FFaker::Address.country) }

# 5.times { Order.create(total_price: prng.rand(10..100), state: 'in progress', user_id: prng.rand(1..5), credit_card_id: 1) }

# CreditCard.create(number: '4142514219000478', card_owner: 'Alex Don', cvv_code: 0o75, \
                  # expiry_date: '05/21', user_id: 1, order_id: 1)
