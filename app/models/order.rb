class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :card
  belongs_to :contact

  has_many :orders_flowers
  has_many :flowers, through: :orders_flowers

  validates :status, inclusion: { in: %w(in_progress purchased rejected)}

  def purchase(the_card, the_contact)
    the_orders_flowers = self.orders_flowers
    the_cost = 0
    #check that the quantity is still good

    Order.transaction do
      the_orders_flowers.each do |of|
        if !of.handlePurchase
          return false
        end
        the_cost += of.cost
      end
    end

    #try and purchase through stripe
    if !the_card.chargeCard(the_cost)
      return false
    end

    #return result
    self.update_attributes(contact: the_contact, card: the_card, status: "purchased")
  end
end