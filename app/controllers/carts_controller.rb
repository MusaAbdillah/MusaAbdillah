class CartsController < ApplicationController

  def show
    @order_items = current_order.order_items
    respond_to do |format|
      format.html
    end
  end

  def check_out
    redirect_to '/orders'
  end
end
