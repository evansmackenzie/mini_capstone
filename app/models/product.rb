class Product < ApplicationRecord

  validates :name, presence:true

  validates :name, uniqueness:true
  
  def is_discounted?
    if price < 10
      return true
    else
      return false
    end
  end

  def tax
    price * 0.09
  end

end
