# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address, type: :model do
  context 'db columns' do
    it { is_expected.to have_db_column(:firstname).of_type(:string) }
    it { is_expected.to have_db_column(:lastname).of_type(:string) }
    it { is_expected.to have_db_column(:address).of_type(:string) }
    it { is_expected.to have_db_column(:city).of_type(:string) }
    it { is_expected.to have_db_column(:zip).of_type(:string) }
    it { is_expected.to have_db_column(:phone).of_type(:string) }
    it { is_expected.to have_db_column(:address_type).of_type(:string) }
  end

  context 'relations' do
    it { is_expected.to belong_to(:country) }
    it { is_expected.to belong_to(:addressable) }
  end
end
