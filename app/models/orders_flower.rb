class OrdersFlower < ActiveRecord::Base
  belongs_to :flower
  belongs_to :order

  before_save :handleCost#, :handleFlowerQuantity

  validates :flower, :order, presence: true
  validates :quantity, numericality: {only_integer: true, greater_than: 0}
  validates :flower, uniqueness: { scope: :order_id }

  #so, there will be the capacity for a user to adjust the quantity of what he's added to his order, i'll need to put something in so the cost is only adjusted while the orders_flowers' order is still in_progress
  def handleCost
    self.cost = self.quantity * self.flower.price
  end

  #ditto this as the handleCost
  def handleFlowerQuantity
    if self.quantity > self.flower.remaining
      return false
    end
  end

  def handlePurchase
    unless self.flower.remaining < self.quantity
      return self.flower.update_attributes(remaining: self.flower.remaining - self.quantity)
    else
      return false
    end
  end

  #check to see if self's flower can support the given quantity
  def checkQuantity(amount)
    (self.flower.remaining + (self.quantity || 0) - amount) >= 0
  end
end