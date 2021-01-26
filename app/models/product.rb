class Product < ApplicationRecord

  belongs_to :supplier
  has_many :images
  has_many :orders

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, length: { in: 10..500 }
  
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
