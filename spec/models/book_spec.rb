# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  context 'db columns' do
    it { is_expected.to have_db_column(:title).of_type(:string) }
    it { is_expected.to have_db_column(:description).of_type(:text) }
    it { is_expected.to have_db_column(:price).of_type(:decimal) }
    it { is_expected.to have_db_column(:quantity).of_type(:integer) }
    it { is_expected.to have_db_column(:materials).of_type(:string) }
    it { is_expected.to have_db_column(:dimensions).of_type(:string) }
    it { is_expected.to have_db_column(:published_at).of_type(:integer) }
  end

  context 'relations' do
    it { is_expected.to have_many(:author_books).dependent(:destroy) }
    it { is_expected.to have_many(:authors).through(:author_books) }
    it { is_expected.to have_many(:reviews).dependent(:destroy) }
    it { is_expected.to have_many(:book_categories).dependent(:destroy) }
    it { is_expected.to have_many(:categories).through(:book_categories) }
    it { is_expected.to have_many(:pictures).dependent(:destroy) }
    it { is_expected.to have_many(:order_items).dependent(:destroy) }
  end
end
