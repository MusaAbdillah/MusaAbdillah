class CartsController < ApplicationController
  def show
    @order_items = current_order.order_items
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => 'pdf', :template => 'report/show'
      end
    end
  end
end
