class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception #???
  before_action :authenticate_user! # before any action of any controller (that's not in devise), check if user is logged in
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :store_current_location, :unless => :devise_controller?
  after_filter :store_location
  before_action :set_badge

  def store_location
    session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
    # store_location_for(:user, request.url)
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

  def after_sign_up_path_for(resource)
    your_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address, :zipcode])
  end

  def set_badge
    @share_count = current_user.meds.select{ |m| m.share.present? && m.share.status == 'requested' }.count
  end

end
