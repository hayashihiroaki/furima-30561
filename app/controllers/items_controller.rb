class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :new, :create, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :show_move_to_index, only: :show

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
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

  def show_move_to_index
    if @item.order.present?
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
