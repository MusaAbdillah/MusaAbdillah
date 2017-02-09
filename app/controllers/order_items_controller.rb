class OrderItemsController < ApplicationController
  before_action :set_order_items, only: [:create, :update, :destroy]
  before_filter :authenticate_user!, only: [:create, :update, :destroy]

 def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    @order.save
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end
private
  def set_order_items
    @order_item = OrderItems.find(params[:id])
  end

  def order_item_params
    params.require(:order_item).permit(:quantity, :stok_id)
  end
end
