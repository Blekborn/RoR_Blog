class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  # helper_method :current_user
  #
  # private
  #
  # def current_user
  #   @current_user ||= Author.find(session[:author_id]) if session[:author_id]
  # end
  #
  # def authorize
  #   redirect_to login_url, alert: 'Not authorized' if current_user.nil?
  # end
end
