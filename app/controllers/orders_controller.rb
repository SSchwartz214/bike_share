class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    unless current_user.id == @order.user.id || current_admin?
      render file: '/public/404'
    end
  end

  def create
    accessories = Accessory.where(id: @cart.accessories)

    total = '%.2f' % @cart.total(accessories)

    @order = current_user.orders.create

    accessories.each do |accessory|
      @order.order_accessories.create(quantity: @cart.contents[accessory.id.to_s], accessory: accessory)
    end

    @cart.clear

    flash[:success] = "Successfully submitted your order totalling $#{total}"

    redirect_to dashboard_path
  end

  def update
    @order = Order.find(params[:id])
    @order.status = params[:new_status]
    @order.save

    redirect_to admin_dashboard_index_path
  end
end
