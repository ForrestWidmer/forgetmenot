class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  around_filter :set_time_zone #Dynamically set time zone based on user.time_zone

  private

  def set_time_zone
    old_time_zone = Time.zone
    Time.zone = current_user.time_zone if user_signed_in?
    yield
  ensure
    Time.zone = old_time_zone
  end
end
