class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home # do avoid authentication on landing page
  skip_before_action :set_badge
  def home
  end
end
