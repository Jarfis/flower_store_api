class Card < ActiveRecord::Base
  belongs_to :user

  has_many :orders

  def chargeCard(cost)
    charge = Stripe::Charge.create(
      customer: self.user.stripe_user,
      card: self.card_token,
      amount: (cost*100).to_i,
      description: 'Rails Stripe customer',
      currency: 'cad'
    )

    true
  rescue Stripe::CardError => e
    false
  end
end