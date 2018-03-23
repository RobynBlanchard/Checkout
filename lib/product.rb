class Product

  attr_reader :code, :price

  def initialize(code, price, title)
    @code = code
    @price = price
    @title = title
  end
end
