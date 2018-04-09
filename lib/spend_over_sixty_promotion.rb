class SpendOverSixtyPromotion

  PERCENTAGE_DISCOUNT = 0.1
  MINIMUM_SPEND = 60

  def self.get_discount(items, total)
    total > MINIMUM_SPEND ? total*PERCENTAGE_DISCOUNT : 0
  end
end
