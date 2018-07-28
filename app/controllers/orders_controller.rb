class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    unless current_user.id == @order.user.id || current_admin?
      render file: '/public/404'
    end
  end
end
