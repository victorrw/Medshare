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
    @share = current_user.share.new(params)
    @share.giver = @med.user
    @share.taker = @current_user
    raise
    @share.save
    # if @share.save
    #   redirect_to user_path(current_user)
    # else
    #   render :new
    # end
  end

  private

  def share_params
    # params.require(:share).permit(:)
  end
end
