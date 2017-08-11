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
    share.status = "requested"
    share.save!
    redirect_to user_path(current_user)
  end

  def edit
    @share = Share.find(params[:id])
  end

  def update
    share = Share.find(params[:id])
    share.update(shipping: share_params[:shipping])
    unless share.shipping.nil?
      share.update(status: "sent")
    end
    redirect_to user_path(current_user)
  end

  private

  def share_params
    params.require(:share).permit(:shipping)
  end

end
