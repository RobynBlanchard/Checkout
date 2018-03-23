require './lib/promotion_service'
require './lib/product'
require './lib/spend_over_sixty_promotion'
require './lib/travel_card_promotion'

class Checkout

  attr_reader :promotion_service, :items

  def initialize(promotion_service=nil)
    unless promotion_service.nil?
      @promotion_service = promotion_service.new
    end
    @items = []
  end

  def scan(item)
    @items << item
  end

  def total
    if promotion_service.nil?
      return "%0.2f" % items.reduce(0) { |total, item| total + item.price }
    else
      return "%0.2f" % promotion_service.apply_promotions(items)
    end
    # TODO - clear items after checkout
  end
end
