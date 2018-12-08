# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'db columns' do
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:encrypted_password).of_type(:string) }
  end

  context 'relations' do
    it { is_expected.to have_many(:reviews).dependent(:destroy) }
    it { is_expected.to have_one(:billing_address).dependent(:destroy) }
    it { is_expected.to have_one(:shipping_address).dependent(:destroy) }
    it { is_expected.to have_many(:orders).dependent(:destroy) }
  end
end
