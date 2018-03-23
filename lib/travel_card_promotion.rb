require './lib/product'

class TravelCardPromotion

  ITEM_CODE = 001
  NEW_PRICE = 8.50

  def apply_promotion(items)
    update_items_price(items)
  end

  private

  def apply_promo?(item, items)
    count = items.count { |item| item.code == 001 }
    (count > 1 && item.code == ITEM_CODE) ? true : false
  end

  def update_items_price(items)
    items.map{ |item| (apply_promo?(item, items)) ? {"code": item.code, "price": NEW_PRICE} :  {"code": item.code, "price": item.price}}
  end
end
