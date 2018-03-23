class PromotionService
  def calculate_total(items)
    codes_and_prices = apply_promotions(items)
    codes_and_prices.reduce(0) { |total, item| total + item[:price] }
  end

  private

  def apply_promotions(items)
    codes_and_prices = TravelCardPromotion.new.apply_promotion(items)
    total1 = calculate_total(codes_and_prices)
    total = SpendOverSixtyPromotion.new.apply_promotion(total1)
  end
end
