require "checkout"
require "promotion_service"
require "product"

describe Checkout do
  let(:item) { double("Product", price: 10.00) }
  let(:promotion_service) { PromotionService }
  subject { described_class.new(promotion_service) }

  describe '#new' do
    it "defaults the promotion service to nil" do
      checkout = Checkout.new
      expect(checkout.promotion_service). to be_nil
    end

    it "accepts a promotion service at creation" do
      expect(subject.promotion_service).to eq promotion_service
    end
  end

  describe '#scan' do
    before(:each) do
      subject.scan(item)
    end

    it "adds an item to items" do
      expect(subject.items.include? item). to be_truthy
      expect(subject.items.count).to eq 1
    end
  end

  describe '#total' do
    context "no items" do
      it "returns to total price of the products as 0" do
        allow(subject).to receive(:discount_from_promotions).and_return(0)
        expect(subject.total).to eq "0.00"
      end
    end

    context "one or more items" do
      it "returns the total price of the products" do
        subject.scan(item)
        allow(subject).to receive(:discount_from_promotions).and_return(0)
        expect(subject.total).to eq "10.00"
      end
    end
  end
end
