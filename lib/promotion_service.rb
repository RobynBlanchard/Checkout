require './lib/spend_over_sixty_promotion'
require './lib/travel_card_promotion'

class PromotionService

  AVAILABLE_PROMOTIONS = [TravelCardPromotion, SpendOverSixtyPromotion]

  def self.discounts(items, total)
    discount = 0
    AVAILABLE_PROMOTIONS.each do |promotion|
      discount += promotion.get_discount(items, total)
    end
    discount
  end
end
