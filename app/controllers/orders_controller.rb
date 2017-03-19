class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    the_orders = Order.joins(:orders_flowers)
    .where("orders.user_id = ? AND orders.status != 'in_progress'", current_user.id)
    .select("orders.id as order_id, SUM(orders_flowers.cost) as order_total")

    render json: {success: true, orders: the_orders}, status: 200
  end

  def show
    #ensure cart exists and belongs to the user
    if Order.exists?(id: params[:id]) && Order.find(params[:id]).user_id == current_user.id
      the_order = OrdersFlower.joins(:order, :flower)
      .where("orders.id = ?", params[:id])
      .select("orders.id as order_id, flowers.id as flower_id, flowers.image, orders_flowers.id as orders_flowers_id, orders_flowers.quantity, orders_flowers.cost")

      render json: {success: true, order: the_order}
    else
      render json: {success: false}, status: 400
    end

  end

  def update
    #bulk update, when the user clicks to proceed to payment details this gets called to mass update the contents of the cart
    #params[:orders_flowers] == {<orders_flowers_id>:<quantity>, ...}
    #ensure cart exists
    Order.transaction do
      the_order = Order.where(user_id: current_user.id, status: "in_progress")[0]
      if the_order
        #i suppose i'll loop through the passed in pairs. making an sql update would be better, but this is faster to write
        params[:orders_flowers].each do |of_id, quant|
          #check to see if the_order's orders_flowers includes the provided id
          #check to see if the quantity will be valid

          of = the_order.orders_flowers.where(id: of_id)[0]

          if of
            if of.checkQuantity(quant)
              flow = of.flower
              flow.remaining = flow.remaining + of.quantity - quant

              flow.save

              of.quantity = quant

              of.save
            end
          end
        end

        render json: {success: true, cart: current_user.orders.where(status: "in_progress")[0]}, status: 200
      else
        render json: {success: false}, status: 400
      end
    end
  end

  def getInProgress
    the_cart = OrdersFlower.joins(:order, :flower)
    .where("orders.status = 'in_progress' AND orders.user_id = ?", current_user.id)
    .select("orders.id as order_id, flowers.id as flower_id, flowers.image, orders_flowers.id as orders_flowers_id, orders_flowers.quantity, orders_flowers.cost")

    #dont really need to handle cases for the cart being empty/not existing, i'll check on the client side and create it as necesary
    render json: {success: true, cart: the_cart}, status: 200
  end

  #purchase defaults to in progress cart
  def purchase
    #params: card_id, contact_id
    #ensure it's the users card and contact and that they exist
    the_card = Card.where(id: params[:card_id], user_id: current_user.id)[0]
    the_address = Contact.where(id: params[:contact_id], user_id: current_user.id)[0]

    if the_card && the_address
      the_cart = current_user.orders.where(status: "in_progress")[0]

      if the_cart.purchase(the_card, the_address)
        render json: {success: true, message: "order purchased"}, status: 200
      else
        render json: {success: false}, status: 400
      end
    else
      render json: {success: false}, status: 400
    end
  end

  #this is getting called when a not logged in user logs in while having stuff in the client side cart and stuff in an in progress cart in the db
  #merges the two carts together
  def mergeCarts

  end
end