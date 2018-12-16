# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |i| "admin#{i}@amazing.com" }
    password { FFaker::Internet.password }
  end
end
