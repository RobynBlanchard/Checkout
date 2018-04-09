require "travel_card_promotion"
require "product"

describe TravelCardPromotion do
  let(:item1) { double("Product", code: 001) }
  let(:item2) { double("Product", code: 002) }
  let(:total) { 20 }

  subject { described_class }

  describe ".get_discount" do
    context "promo valid for items" do
      it "returns a discount greater than 0" do
        items = [item1, item1]
        # allow_(subject).to receive(:promo_valid_for_basket?).and_return true
        # allow(subject).to receive(:calculate_discount).and_return 10
        TravelCardPromotion.get_discount(items,total)
        # expect(subject.get_discount(items, total)).to eq 10
      end
    end

    context "promo not valid for items" do
      it "returns a discount of 0" do
        items = [item1, item2]
        allow(subject).to receive(:promo_valid_for_basket?).and_return false

        expect(subject.get_discount(items, total)).to eq 0
      end
    end
  end
end
