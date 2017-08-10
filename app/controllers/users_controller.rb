class UsersController < ApplicationController
  # before_action :set_user, only: [:edit, :update, :show]

  # def new
  #   @user = User.new
  # end

    def create
    @user = current_user.build(user_params)

    if @restaurant.save
      RestaurantMailer.creation_confirmation(@restaurant).deliver_now
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit

  end

  def update
    # if @user.update(user_params)
    #   redirect_to @user
    # else
    #   render :edit
    # end
  end

  def show
    @transaction = {}
    @transactions = []
    @meds = Med.where(user_id: current_user.id)
    @meds = @meds.where(share_id: nil)
    @shares = Share.where(taker_id: current_user.id)
    @shares.each do |share|
      @transaction[:share] = share.id
      @transaction[:med] = Med.find_by(share_id: share.id)
      @transaction[:giver] = User.find(@transaction[:med].user_id)
      @transactions << @transaction
    end
  end

  # private

  # def user_params
  #   require(:user).permit(params[:name, :zipcode, :email, :address])
  # end

  # def set_user
  #   @user = User.find(params[:id])
  # end
end
