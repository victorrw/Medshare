class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home # do avoid authentication on landing page
  def home
  end
end
