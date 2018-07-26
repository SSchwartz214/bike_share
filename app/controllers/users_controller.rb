class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  before_action :authorized?, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      flash.now[:alert] = @user.errors.full_messages.join("<br>").html_safe
      render :new
    end
  end

  def edit
    if current_user.id.to_s != params[:id]
      redirect_to edit_user_path(current_user)
    end
  end

  def update
    @user.update(user_params)
    if @user.save && current_user.admin?
      flash[:success] = "Your profile has been updated!"
      redirect_to admin_dashboard_index_path
    elsif @user.save && !current_user.admin?
      flash[:success] = "Your profile has been updated!"
      redirect_to dashboard_path
    else
      flash.now[:alert] = @user.errors.full_messages.join("<br>").html_safe
      render :edit
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :password, :username)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
