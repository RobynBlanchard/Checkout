require './lib/promotion_service'
require './lib/product'
require 'yaml'

class Checkout

  attr_reader :promotion_service, :items

  def initialize(promotion_service=nil)
    @promotion_service = promotion_service
    @items = []
    # @products = load_product_catalogue
  end

  def scan(item)
    @items << item
  end

  def total
    "%0.2f" % (initial_total - discount_from_promotions)
  end

  private

  # def load_product_catalogue
  #   products = {}
  #   yaml_hash = YAML.load_file("./lib/products.yml")
  #   yaml_hash.each do |product|
  #     item = Product.new(code: product["code"],
  #       price: product["price"],
  #       title: product["title"]
  #     )
  #     products[product["code"]] = item
  #   end
  #   products
  # end

  def initial_total
    items.reduce(0) { |total, item| total + item.price }
  end

  def discount_from_promotions
    promotion_service.discounts(items, initial_total)
  end
end
