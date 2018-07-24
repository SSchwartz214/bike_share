class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_admin?
    current_user && current_user.admin?
  end

<<<<<<< HEAD
=======
  def require_admin
    render file:'/public/404' unless current_admin?
  end

>>>>>>> 6e85a68ea8bbb81d45bd02b9a9663d616c571832
  def authorized?
    render file: "/public/404" unless current_user
  end
end
