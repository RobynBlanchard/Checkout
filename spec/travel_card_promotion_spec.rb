require "travel_card_promotion"
require "product"

describe TravelCardPromotion do
  let(:item1) { double("Product", code: 001, price: 9.25) }
  let(:item2) { double("Product", code: 002, price: 45.00) }
  let(:item3) { double("Product", code: 003, price: 19.95) }

  subject { described_class.new }

  describe "apply_promotion" do
    context "items not applicable to promotion" do
      it "returns a map of product codes and prices with no promotion applied" do
        items = [item1]
        expected_result = [{"code": 001, "price": 9.25}]
        expect(subject.apply_promotion(items)).to eq expected_result
      end

      it "returns a map of product codes and prices with no promotion applied" do
        items = [item2, item3]
        expected_result = [{"code": 002, "price": 45.00}, {"code": 003, "price": 19.95}]
        expect(subject.apply_promotion(items)).to eq expected_result
      end
    end

    context "basket applicable to promotion" do
      it "returns a map of product codes and prices with a promotion applied" do
        items = [item1, item1]
        expected_items = [{"code": 001, "price": 8.50}, {"code": 001, "price": 8.50}]
        expect(subject.apply_promotion(items)).to eq expected_items
      end

      it "returns a map of product codes and prices with a promotion applied" do
        items = [item1, item3, item1]
        expected_items = [{"code": 001, "price": 8.50}, {"code": 003, "price": 19.95}, {"code": 001, "price": 8.50}]
        expect(subject.apply_promotion(items)).to eq expected_items
      end
    end
  end
end
