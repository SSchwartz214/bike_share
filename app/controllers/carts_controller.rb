class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    accessory = Accessory.find(params[:accessory_id])
    @cart = Cart.new(session[:cart])
    @cart.add_accessory(accessory.id)
    session[:cart] = @cart.contents
    quantity = @cart.contents[accessory.id].to_s


    if params[:path] == 'show'
      flash[:notice] = "#{pluralize(quantity, "accessory")} added to cart"
      redirect_to accessory_path(accessory)
    elsif params[:path] == 'index'
      redirect_to accessories_path
    end
  end
end
