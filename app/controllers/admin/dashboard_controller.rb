class Admin::DashboardController < Admin::BaseController

  def index
    if(params[:status])
      @orders = Order.where(status: params[:status])
    else
      @orders = Order.all
    end
    @order_by_status = Order.group_by_status
  end
end
