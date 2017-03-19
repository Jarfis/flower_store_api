class FlowersController < ApplicationController
  #index, #show

  def show
    if Flower.exists?(id: params[:id])
      render json: {success: true, flower: Flower.find(params[:id])}, status: 200
    else
      render json: {success: false}, status: 400
    end
  end

  def index
    render json: {success: true, flowers: Flower.all}, status: 200
  end

  def randomFlowers
    render json: {success: true, flowers: Flower.order("RANDOM()").limit(4)}, status: 200
  end
end