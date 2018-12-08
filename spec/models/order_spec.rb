# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'db columns' do
    it { is_expected.to have_db_column(:order_number).of_type(:string) }
    it { is_expected.to have_db_column(:total_price).of_type(:decimal) }
    it { is_expected.to have_db_column(:status).of_type(:integer) }
    it { is_expected.to have_db_column(:user_id).of_type(:integer) }
    it { is_expected.to have_db_column(:delivery_id).of_type(:integer) }
    it { is_expected.to have_db_column(:coupon_id).of_type(:integer) }
  end

  context 'relations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:delivery) }
    it { is_expected.to belong_to(:coupon) }
    it { is_expected.to have_one(:credit_card).dependent(:destroy) }
    it { is_expected.to have_many(:order_items).dependent(:destroy) }
    it { is_expected.to have_one(:billing_address).dependent(:destroy) }
    it { is_expected.to have_one(:shipping_address).dependent(:destroy) }
  end
end
