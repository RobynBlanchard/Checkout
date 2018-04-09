class Product

  attr_reader :code, :price

  def initialize(code: code, price: price, title: title)
    @code = code
    @price = price
    @title = title
  end
end
