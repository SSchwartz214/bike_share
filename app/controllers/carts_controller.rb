class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper
  before_action :update, only: [:remove_item]

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

  def update
    new_totals = {}
    params.keys.each do |key|
      if key.to_s.include?("accessory_")
        id = key.to_s[-1]
        new_totals[id] = params[key]
      end
    end
    @cart.update_totals(new_totals)
  end

  def remove_item
    id = params["accessory_id"]
    name = Accessory.find(id.to_i).name
    @cart.remove_accessory(id)
    flash[:notice] = "You successfully removed #{name} from your cart"
    # flash[:notice] = "You successfully removed #{view_context.link_to(name, accessory_path(id))} from your cart"
    redirect_to cart_path
  end
end
