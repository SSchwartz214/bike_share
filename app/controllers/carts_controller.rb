class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    accessory = Accessory.find(params[:accessory_id])
    @cart = Cart.new(session[:cart])
    @cart.add_accessory(accessory.id)
    session[:cart] = @cart.contents
    quantity = @cart.contents[accessory.id.to_s]

    if params[:path] == 'show'
      flash[:notice] = "#{quantity} #{accessory.name} in your cart"
      redirect_to accessory_path(accessory)
    elsif params[:path] == 'index'
      flash[:notice] = "#{quantity} #{accessory.name} in your cart"
      redirect_to accessories_path
    elsif params[:path] == 'checkout'
      redirect_to root_path
    end
  end

  def show
    @accessories = Accessory.where(id: @cart.accessories)
  end

  def checkout
    new_totals = {}
    params.keys.each do |key|
      if key.to_s.include?("accessory_")
        id = key.to_s[-1]
        new_totals[id] = params[key]
      end
    end

    @cart.update_totals(new_totals)

    accessories = Accessory.where(id: @cart.accessories)

    flash[:success] = "Successfully submitted your order totalling $#{@cart.total(accessories)}"

    redirect_to dashboard_path
  end
end
