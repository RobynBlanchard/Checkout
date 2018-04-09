require "spend_over_sixty_promotion"
require "product"

describe SpendOverSixtyPromotion do
  let(:item) { double(Product) }
  let(:total) { 70 }

  subject { described_class }

  describe ".get_discount" do
    context "promo valid for items" do
      it "returns a discount greater than 0" do
        items = [item]
        expect(subject.get_discount(items, total)).to eq 7
      end
    end

    context "promo not valid for items" do
      it "returns a discount of 0" do
        items = [item]
        total = 10
        expect(subject.get_discount(items, total)).to eq 0
      end
    end
  end
end
