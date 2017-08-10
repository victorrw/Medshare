class SharesController < ApplicationController
  def index
    #show all user shares
    @shares = Share.all
  end

  def new
    @share = Share.new
    @med = Med.find(params[:med_id])
  end

  def create
    share = Share.new
    share.med = Med.find(params[:med_id])
    share.taker = current_user
    share.save!

    redirect_to user_path(current_user)
    # if @share.save
    #   redirect_to user_path(current_user)
    # else
    #   render :new
    # end
  end
end
