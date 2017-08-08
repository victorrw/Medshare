class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception #???
  before_action :authenticate_user! # before any action of any controller (that's not in devise), check if user is logged in
  before_action :configure_permitted_parameters, if: :devise_controller?


  # skip_before_action :authenticate_user!, only: :home
  # def home
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address, :zipcode])
  end

end
