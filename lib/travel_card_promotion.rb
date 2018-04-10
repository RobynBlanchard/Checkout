require './lib/item'

class TravelCardPromotion

  ITEM_CODE = 001
  MINIMUM_NUMBER_REQUIRED = 2
  DISCOUNT_PER_ITEM = 0.75

  def self.get_discount(items, total)
    promo_valid_for_basket?(items) ? calculate_discount(items) : 0
  end

  private

  def self.promo_valid_for_basket?(items)
    items.count { |item| item.code == ITEM_CODE} >= MINIMUM_NUMBER_REQUIRED
  end

  def self.calculate_discount(items)
    items.reduce(0) { |discount, item| discount + DISCOUNT_PER_ITEM if item.code == ITEM_CODE}
  end
end
