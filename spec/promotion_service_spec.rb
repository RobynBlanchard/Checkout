require "promotion_service"
require "item"

describe PromotionService do
  let(:item) { double(Item) }
  let(:total) { 10 }
  subject { described_class }

  describe ".discounts" do
    context "it returns the total discount" do
      it "returns a total with a discount" do
        items = [item]
        allow(TravelCardPromotion).to receive(:get_discount).and_return 5
        allow(SpendOverSixtyPromotion).to receive(:get_discount).and_return 0

        expect(subject.discounts(items,total)).to eq 5
      end
    end
  end
end
