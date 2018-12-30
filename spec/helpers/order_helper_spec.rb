# frozen_string_literal: true

RSpec.describe OrderHelper, type: :helper do
  let(:order) { create(:order, :with_associations).decorate }

  describe '#order_sort_by' do
    it "returns order sort by 'all'" do
      expect(helper.order_sort_by).to eq(I18n.t('sort').fetch(:all))
    end
  end

  describe '#status' do
    it "returns order sort by status 'in_queue'" do
      order.in_queue!
      expect(helper.status(order.status)).to eq(I18n.t('sort').fetch(order.status.to_sym))
    end
  end

  describe '#order_total_count' do
    helper do
      def current_order; end
    end
    it 'returns total order amount' do
      allow(helper).to receive(:current_order).and_return order
      expect(helper.order_total_count).to eq(order.total_count)
    end
  end
end
