class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :current_admin?
  before_action :set_cart

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def require_admin
    render file:'/public/404' unless current_admin?
  end

  def authorized?
    render file: "/public/404" unless current_user
  end

  def set_cart
    @cart = Cart.new(session[:cart])
  end

  def assign_id(model)
    if model.count > 0
      model.maximum(:id).next
    else
      1
    end
  end
end
