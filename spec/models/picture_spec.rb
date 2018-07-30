# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Picture, type: :model do
  context 'db columns' do
    it { is_expected.to have_db_column(:file).of_type(:string) }
    it { is_expected.to have_db_column(:imageable_type).of_type(:string) }
    it { is_expected.to have_db_column(:imageable_id).of_type(:integer) }
  end

  context 'relations' do
    it { is_expected.to belong_to(:imageable) }
  end
end
