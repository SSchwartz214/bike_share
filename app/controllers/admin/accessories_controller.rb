class Admin::AccessoriesController < ApplicationController
  before_action :set_accessory, only: [:edit, :update, :destroy]
  before_action :require_admin

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
    params.require(:accessory).permit(:status)
  end
end
