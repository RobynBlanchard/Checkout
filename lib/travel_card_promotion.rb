require './lib/product'

class TravelCardPromotion

  ITEM_CODE = 001
  MINIMUM_NUMBER_REQUIRED = 2
  DISCOUNT_PER_PRODUCT = 0.75

  def self.get_discount(items, total)
    if promo_valid_for_basket?(items)
      calculate_discount(items)
    end
  end

  private

  def promo_valid_for_basket?(items)
    items.count { |item| item.code == ITEM_CODE} >= MINIMUM_NUMBER_REQUIRED
  end

  def calculate_discount(items)
    items.reduce(0) { |discount, item| discount + DISCOUNT_PER_PRODUCT if item.code == ITEM_CODE}
  end
end
