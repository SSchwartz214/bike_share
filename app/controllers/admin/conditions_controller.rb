class Admin::ConditionsController < Admin::BaseController
  before_action :set_condition, only: [:edit, :update, :destroy]

  def new
    @condition = Condition.new
  end

  def create
    @condition = Condition.new(condition_params)
    if @condition.save
      flash[:success] = "Weather created!"
      redirect_to condition_path(@condition)
    else
      flash.now[:alert] = @condition.errors.full_messages.join("<br>").html_safe
      render :new
    end
  end


  def edit

  end

  def update
    @condition.update(condition_params)
    if @condition.save
      flash[:success] = "Weather updated!"
      redirect_to condition_path(@condition)
    else
      flash.now[:alert] = @condition.errors.full_messages.join("<br>").html_safe
      render :edit
    end
  end

  def destroy
    date = @condition.date.to_s.chomp("00:00:00 UTC")
    @condition.destroy

    flash[:success] = "Weather for #{date} deleted!"
    redirect_to conditions_path
  end

  private

  def set_condition
    @condition = Condition.find(params[:id])
  end

  def condition_params
    params.require(:condition).permit(:date, :mean_temperature_f, :max_temperature_f, :min_temperature_f, :mean_humidity, :mean_visibility_miles, :mean_wind_speed_mph, :precipitation_inches)
  end

end
