require "travel_card_promotion"
require "item"

describe TravelCardPromotion do
  let(:calculated_discount) { 10 }
  subject { described_class }

  describe ".get_discount" do
    context "promo valid for items" do
      it "returns a discount greater than 0" do
        allow(subject).to receive(:promo_valid_for_basket?).and_return true
        allow(subject).to receive(:calculate_discount).and_return calculated_discount
        expect(subject.get_discount(:items, :total)).to eq calculated_discount
      end
    end

    context "promo not valid for items" do
      it "returns a discount of 0" do
        allow(subject).to receive(:promo_valid_for_basket?).and_return false
        expect(subject.get_discount(:items, :total)).to eq 0
      end
    end
  end
end
