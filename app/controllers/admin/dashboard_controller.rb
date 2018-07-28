class Admin::DashboardController < Admin::BaseController

  def index
    @orders = Order.all
    @order_by_status = Order.group_by_status
  end
end
