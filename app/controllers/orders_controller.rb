class OrdersController < ApplicationController
  def index
    @order = Item.find(params[:item_id])
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private 
  def order_params
    params.permit(:prefectures_id, :postal_code, :city, :house_number, :building_name, :phone_number, :item_id).merge(user_id: current_user.id)
  end
end
