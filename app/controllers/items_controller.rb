class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only:[ :show, :edit, :update, :destroy]
  before_action :user_to_index, only: [:edit, :destroy]
  

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

  def show
  end

  def edit
  end

  def update
    if @item.update(items_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy 
    if @item.destroy
      redirect_to root_path
    end
  end


  private
  def items_params
    params.require(:item).permit(:title, :explanation, :category_id, :status_id, :delivery_fee_id, :ship_form_id, :delivery_days_id, :image, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def user_to_index
    unless user_signed_in? && current_user.id == @item.user.id 
      redirect_to action: :index
    end
  end
end
