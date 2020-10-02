class ItemsController < ApplicationController
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end
end

private

def item_params
  params.require(:item).permit(:name, :image, :status_id, :explanation, :price, :delivery_charge_id, :shipment_source_id, :shipping_days_id, :category_id).merge(user_id: current_user.id)
end
