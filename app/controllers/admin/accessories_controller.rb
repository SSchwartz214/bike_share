class Admin::AccessoriesController < Admin::BaseController

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

    private
    def accessory_params
      params.require(:accessory).permit(:name, :description, :price, :image, :image_url)
    end
end
