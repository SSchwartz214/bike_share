class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    unless current_user.id == @order.user.id || current_admin?
      render file: '/public/404'
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.status = params[:new_status]
    @order.save

    redirect_to admin_dashboard_index_path
  end
end
