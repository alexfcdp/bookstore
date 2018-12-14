# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    order_number { "R#{Array.new(8) { [*'0'..'9'].sample }.join}" }
  end
end
