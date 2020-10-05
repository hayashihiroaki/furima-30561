class OrdersController < ApplicationController
  def index
    @order = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
  end

  def create
    @order = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private 
  def order_params
    params.permit(:prefectures_id, :postal_code, :city, :house_number, :building_name, :phone_number, :item_id).merge(user_id: current_user.id,token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_5fc9024271b2cbbe73450c73"  
    Payjp::Charge.create(
      amount: @order.price, 
      card: order_params[:token],    
      currency: 'jpy'    
    )
  end
end
