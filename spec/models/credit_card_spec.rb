# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreditCard, type: :model do
  context 'db columns' do
    it { is_expected.to have_db_column(:number).of_type(:string) }
    it { is_expected.to have_db_column(:card_owner).of_type(:string) }
    it { is_expected.to have_db_column(:cvv_code).of_type(:integer) }
    it { is_expected.to have_db_column(:expiry_date).of_type(:string) }
    it { is_expected.to have_db_column(:user_id).of_type(:integer) }
    it { is_expected.to have_db_column(:order_id).of_type(:integer) }
  end

  context 'relations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:orders) }
  end
end
