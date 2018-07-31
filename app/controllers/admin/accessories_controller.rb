class Admin::AccessoriesController < ApplicationController
  before_action :set_accessory, only: [:edit, :update, :destroy]
  before_action :require_admin

  def new
   @accessory = Accessory.new
 end

 def create
   @accessory = Accessory.new(accessory_params)
   if @accessory.image_url.empty?
     @accessory.image_url = "https://upload.wikimedia.org/wikipedia/commons/6/63/French_horn_front.png"
   end
   if @accessory.price.nil? || @accessory.price < 0
     flash[:warning] = "Price must be present and cannot be negative."
     render :new
   elsif @accessory.description.nil? || @accessory.description == ""
     flash[:warning] = "Description must be present"
     render :new
   elsif @accessory.save
     flash[:notice] = "#{@accessory.name} created successfully!"
     redirect_to accessory_path(@accessory)
   else
     flash[:warning] = "Please choose another name"
     render :new
   end
 end

  def index
    @accessories = Accessory.all
  end

  def edit

  end

  def update
    if params[:path] == "index"
      @accessory.status = params[:status]
      @accessory.save
      redirect_to admin_bike_shop_path
    else

      @accessory.update(accessory_params)
      if @accessory.image_url.empty?
        @accessory.image_url = "https://upload.wikimedia.org/wikipedia/commons/6/63/French_horn_front.png"
      end
      if @accessory.price.nil? || @accessory.price < 0
        flash[:warning] = "Price must be present and cannot be negative."
        render :edit
      elsif @accessory.description.nil? || @accessory.description == ""
        flash[:warning] = "Description must be present"
        render :new
      elsif @accessory.save
        redirect_to accessory_path(@accessory)
      else
        render :edit
      end
    end
  end

  def destroy
    acc_name = @accessory.name
    @accessory.order_accessories.each do |order_accessory|
      order_accessory.destroy
    end
    @accessory.destroy

    flash[:notice] = "#{acc_name} deleted!"
    redirect_to admin_bike_shop_path
  end

  private

  def set_accessory
    @accessory = Accessory.find(params[:id])
  end

  def accessory_params
    params.require(:accessory).permit(:name, :description, :price, :image_url, :status)
  end
end
