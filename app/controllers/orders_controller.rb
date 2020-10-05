class OrdersController < ApplicationController
  before_action :move_to_index
  before_action :authenticate_user!, only: [:index]
  before_action :set_order, only: [:index, :create]

  def index
    @order_address = OrderAddress.new(order_params)
  end

  def create
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
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @order.price, 
      card: order_params[:token],    
      currency: 'jpy'    
    )
  end

  def move_to_index
    @order = Item.find(params[:item_id])

    if (user_signed_in? && current_user.id == @order.user_id) || @order.order
      redirect_to root_path
    end
  end

  def set_order
    @order = Item.find(params[:item_id])
  end
end