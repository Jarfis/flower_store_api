class CardsController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: {success: true, cards: current_user.cards.where("cards.archived = false").select("cards.id, cards.brand, cards.expiry_month, cards.expiry_year, cards.last4, cards.default")}, status: 200
  end

  def create
    if current_user.stripe_user
      res = Stripe::Customer.retrieve(current_user.stripe_user).sources.create({source: params[:stripe_token]})

      #not implementing actually setting default card atm so just doing this instead
      current_user.cards.update_all(default: false)
      the_card = Card.create(user: current_user, card_token: res[:id], expiry_month: res[:exp_month], expiry_year: res[:exp_year], brand: res[:brand], last4: res[:last4], default: true)
    else
      res = Stripe::Customer.create(source: params[:stripe_token], email: current_user.email)

      current_user.stripe_user = res[:id]
      current_user.save

      the_card = Card.create(user: current_user, card_token: res[:sources][:data][0][:id], expiry_month: res[:sources][:data][0][:exp_month], expiry_year: res[:sources][:data][0][:exp_year], brand: res[:sources][:data][0][:brand], last4: res[:sources][:data][0][:last4], default: true)
    end

    render json: {success: true, the_card: the_card.attributes.slice("id", "brand", "expiry_month", "expiry_year", "last4")}, status: 200

  rescue Stripe::CardError => e
    render json: {success: false, error: "stripe declined card"}, status: 400
  end

  def destroy
    the_card = Card.where(user_id: current_user.id, id: params[:id])[0]

    if the_card && the_card.update_attributes(archived: true)
      render json: {success: true}, status: 200
    else
      render json: {success: false}, status: 400
    end

  end

  def setDefault
    previous_default = Card.where(user_id: current_user.id, default: true)[0]
    the_card = Card.where(user_id: current_user.id, id: params[:id])[0]

    if the_card && the_card.update_attributes(default: true)
      if previous_default
        previous_default.update_attributes(default: false)
      else
        render json: {success: false}, status: 400
      end

      render json: {success: true, message: "Card marked as default"}, status: 200
    else
      render json: {success: false}, status: 400
    end
  end
end