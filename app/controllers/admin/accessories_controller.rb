class Admin::AccessoriesController < ApplicationController
  before_action :set_accessory, only: [:edit, :update, :destroy]
  before_action :require_admin

  def new
   @accessory = Accessory.new
 end

 def create
   @accessory = Accessory.new(accessory_params)
   @accessory.id = assign_id(Accessory)
   if @accessory.save
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
    end
  end

  def destroy
    acc_name = @accessory.name
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
