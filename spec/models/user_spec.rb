# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'db columns' do
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:encrypted_password).of_type(:string) }
  end

  context 'relations' do
    it { is_expected.to have_many(:reviews) }
    it { is_expected.to have_one(:picture) }
    it { is_expected.to have_many(:addresses) }
    it { is_expected.to have_many(:orders) }
  end
end
