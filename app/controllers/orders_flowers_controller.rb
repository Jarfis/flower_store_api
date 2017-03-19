class OrdersFlowersController < ApplicationController
  before_action :authenticate_user!

  #params: quantity, flower_id
  #what happens when the user hits "add to cart"
  def create
    #order is going to default to the in_progress one for the user or create a new in progress one if necesary
    #note to self: check to see if the order already has the given flower in it, if so redirect to update
    #ensure flower exists, has stock. stock check is being handled
    OrdersFlower.transaction do
      flower = Flower.where(id: params[:flower_id])[0]

      if Order.exists?(status: "in_progress", user_id: current_user.id)
        in_p_order = current_user.orders.where(status: "in_progress")[0]
      else
        in_p_order = Order.create(user: current_user)
      end

      #flower exists
      if flower
        #flower in cart already?
        if in_p_order.orders_flowers.where(flower_id: params[:flower_id]).count > 0
          of = in_p_order.orders_flowers.where(flower_id: params[:flower_id])[0]
        else
          of = OrdersFlower.new(order: in_p_order, flower_id: params[:flower_id], quantity: 0)
        end

        #is there enough of the flower remaining
        if flower.remaining + (of.quantity || 0) - params[:quantity] >= 0
          orig_quantity = of.quantity

          of.quantity = params[:quantity]

          if of.save
            flower.remaining = flower.remaining + (orig_quantity || nil) - of.quantity
            flower.save

            render json: {success: true, orders_flower: of}, status: 200
          else
            render json: {success: false}, status: 400
          end
        else
          render json: {success: false}, status: 400
        end
      else
        render json: {success: false}, status: 400
      end
    end
  end

  #only used if they modify the quantity
  def update
    #params: id, quantity
    #ensure it exists, belongs to the user, belongs to the in progress cart
    if OrdersFlower.joins(:order).where("orders.user_id = ? AND orders.status = 'in_progress' AND orders_flowers.id = ?", current_user.id, params[:id]).count == 1  #if it's more than one then we have entirely new problems
      of = OrdersFlower.find(params[:id])

      #we'll need to recheck remaining
      #we'll take the current quantity, add it to the remaining, then compare that to the new quantity
      old_quantity = of.quantity
      old_remaining = of.flower.remaining
      if params[:quantity] <= of.flower.remaining + of.quantity
        if OrdersFlower.find(params[:id]).update_attributes(quantity: params[:quantity])
          of.flower.remaining = old_remaining + old_quantity - params[:quantity]
          of.flower.save
          render json: {success: true, orders_flower: of}, status: 200
        else
          render json: {success: false}, status: 400
        end
      else
        render json: {success: false}, status: 400
      end
    else
      render json: {success: false}, status: 400
    end
  end

  #removing item from cart
  def destroy
    #params: id
    #ensure it exists, ensure it belongs to the user, ensure it belongs to the in_progress order
    if OrdersFlower.joins(:order).where("orders.user_id = ? AND orders.status = 'in_progress' AND orders_flowers.id = ?", current_user.id, params[:id]).count == 1  #if it's more than one then we have entirely new problems
      if OrdersFlower.find(params[:id]).destroy
        render json: {success: true}, status: 200
      else
        render json: {success: false}, status: 400
      end
    else
      render json: {success: false}, status: 400
    end
  end
end