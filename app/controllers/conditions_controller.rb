class ConditionsController < ApplicationController
  before_action :set_condition, only: [:show, :edit, :update, :destroy]

  def index
    @conditions = Condition.paginate(:page => params[:page], :per_page => 50)
  end

  def show
    @condition = Condition.find(params[:id])
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

  private

  def set_condition
    @condition = Condition.find(params[:id])
  end

  def condition_params
    params.require(:condition).permit(:date, :mean_temperature_f, :max_temperature_f, :min_temperature_f, :mean_humidity, :mean_visibility_miles, :mean_wind_speed_mph, :precipitation_inches)
  end
end
