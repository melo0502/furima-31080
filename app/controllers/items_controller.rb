class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def items_params
    params.require(:item).permit(:title, :explanation, :category_id, :status_id, :delivery_fee_id, :ship_form_id, :delivery_days_id, :image, :price).merge(user_id: current_user.id)
  end

end
