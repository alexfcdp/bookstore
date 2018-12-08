# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Coupon, type: :model do
  context 'db columns' do
    it { is_expected.to have_db_column(:code).of_type(:string) }
    it { is_expected.to have_db_column(:discount).of_type(:integer) }
  end

  context 'relations' do
    it { is_expected.to have_many(:orders).dependent(:destroy) }
  end
end