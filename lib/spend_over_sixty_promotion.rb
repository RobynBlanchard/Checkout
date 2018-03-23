class SpendOverSixtyPromotion 
  def apply_promotion(total)
    total > 60 ? total*0.9 : total
  end
end
