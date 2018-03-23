require "promotion_service"
require "product"

describe PromotionService do
  subject { described_class.new }
  let(:item1) { double("Product", code: 001, price: 9.25)}
  let(:item2) { double("Product", code: 002, price: 45.00)}
  let(:item3) { double("Product", code: 003, price: 19.95)}

  let(:items_and_prices) { [{"code": 001, "price": 8.5}, {"code": 003, "price":19.95}, {"code": 001, "price": 8.5}] }

  describe "#calculate_total" do
    context "promotions are applicable to items" do
      let(:items) { [item1, item3, item1] }

      it "returns a total with a discount" do
        allow(subject).to receive(:apply_promotions).and_return(items_and_prices)
        expect(subject.calculate_total(items)).to eq 36.95
      end
    end
  end
end
