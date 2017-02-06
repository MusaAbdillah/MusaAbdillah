class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all.order('created_at DESC')
  end

  def show
    @order_items = @order.order_items
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html {redirect_to '/stoks'}
    end
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:subtotal, :tax, :harga_beli, :shipping, :total, :order_status_id)
    end

end