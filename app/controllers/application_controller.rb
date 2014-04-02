class ApplicationController < ActionController::Base
  protect_from_forgery
=begin
  around_filter: :set_user_time_zone

  private

  def set_time_zone
    old_time_zone = Time.zone
    Time.zone = current_user.time_zone if logged_in?
    yield
  ensure
    Time.zone = old_time_zone
  end
=end
end
