# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Delivery, type: :model do
  context 'db columns' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:terms).of_type(:text) }
    it { is_expected.to have_db_column(:price).of_type(:decimal) }
  end
end
