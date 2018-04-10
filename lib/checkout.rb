require './lib/promotion_service'
require './lib/item'
require 'yaml'

class Checkout

  attr_reader :promotion_service, :items

  def initialize(promotion_service=nil)
    @promotion_service = promotion_service
    @items = []
    # @items = load_item_catalogue
  end

  def scan(item)
    @items << item
  end

  def total
    "%0.2f" % (initial_total - discount_from_promotions)
  end

  private

  # def load_item_catalogue
  #   items = {}
  #   yaml_hash = YAML.load_file("./lib/items.yml")
  #   yaml_hash.each do |item|
  #     item = Item.new(code: item["code"],
  #       price: item["price"],
  #       title: item["title"]
  #     )
  #     items[item["code"]] = item
  #   end
  #   items
  # end

  def initial_total
    items.reduce(0) { |total, item| total + item.price }
  end

  def discount_from_promotions
    promotion_service.discounts(items, initial_total)
  end
end
