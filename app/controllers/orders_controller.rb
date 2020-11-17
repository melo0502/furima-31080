class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_order, only: [:index, :create]
  before_action :order_to_index, only: :index 

  def index
    @order_address = AddressOrder.new
  end


  def create
    @order_address =  AddressOrder.new(order_params) 
    if @order_address.valid?
      pay_item
      @order_address.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:ship_form_id, :postal_code, :phone_number, :municipality, :address, :building_name).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: params[:token],    
      currency: 'jpy'                 
    )
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def order_to_index
    if user_signed_in? && current_user.id == @item.user_id && @item.order.present?
      redirect_to root_path
    elsif @item.order.present?
      redirect_to root_path
    end
  end
end

