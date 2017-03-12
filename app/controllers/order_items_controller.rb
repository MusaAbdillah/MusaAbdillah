class OrderItemsController < ApplicationController
   before_filter :authenticate_user!, only: [:create, :update, :destroy, :final_order]

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

  def final_order
     @order = current_order
     session[:order_id] = nil
     redirect_to @order, flash: {success: "Yay! Pesanan berhasil di buat! terima kasih sudah berbelanja di toko kami :), jangan lupa segera melakukan pembayaran ya :)"}
  end

  private

   def order_item_params
      params.require(:order_item).permit(:quantity, :stok_id)
   end
end
