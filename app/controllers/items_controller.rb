class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :new, :create]

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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path  
  end
end

private

def item_params
  params.require(:item).permit(:name, :image, :status_id, :explanation, :price, :delivery_charge_id, :shipment_source_id, :shipping_days_id, :category_id).merge(user_id: current_user.id)
end

def move_to_index
  @item = Item.find(params[:id])
  
  unless user_signed_in? && current_user.id == @item.user_id
    redirect_to action: :index
  end
end