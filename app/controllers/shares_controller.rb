class SharesController < ApplicationController
  def index
    #show all user shares
    @shares = Share.all
  end

  def new
    @share = Share.new
  end

  def create
    @share = current_user.share.new(share_params)
    if @share.save
      redirect_to shares_path
    else
      render :new
  end
end
