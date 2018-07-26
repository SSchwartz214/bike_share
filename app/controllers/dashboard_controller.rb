class DashboardController < ApplicationController
  before_action :authorized?

  def index
    @orders = current_user.orders
  end
end
