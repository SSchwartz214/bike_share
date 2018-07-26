class Admin::AccessoriesController < Admin::BaseController

  def new
    @accessory = Accessory.new
  end

  def create
    @accessory = Accessory.new(accessory_params)
    if @accessory.save
      flash[:notice] = "#{@accessory.name} created successfully!"
      redirect_to accessories_path(@accessory)
    else
      render :new
    end
  end

    private
    def accessory_params
      params.require(:accessory).permit(:name, :description, :price, :image_url)
    end
end
