class PromotionService
  def calculate_total(items)
    codes_and_prices = apply_promotions(items)
    codes_and_prices.reduce(0) { |total, item| total + item[:price] }
  end

  private

  def apply_promotions(items)
    TravelCardPromotion.new.apply_promotion(items)
  end
end
