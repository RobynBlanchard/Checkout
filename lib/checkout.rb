require './lib/promotion_service'
require './lib/product'

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
    items.reduce(0) { |total, item| total + item.price }
  end
end
