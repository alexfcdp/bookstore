# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Author, type: :model do
  context 'db columns' do
    it { is_expected.to have_db_column(:firstname).of_type(:string) }
    it { is_expected.to have_db_column(:lastname).of_type(:string) }
    it { is_expected.to have_db_column(:biography).of_type(:text) }
  end

  context 'relations' do
    it { is_expected.to have_many(:author_books).dependent(:destroy) }
    it { is_expected.to have_many(:books).through(:author_books) }
  end
end
