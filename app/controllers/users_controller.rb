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
    #returns medicaments available to donation by current user
    @meds = current_user.meds
    #returns all donations requested by current user
    @shares = Share.where(taker_id: current_user.id)

  end

  # private

  # def user_params
  #   require(:user).permit(params[:name, :zipcode, :email, :address])
  # end

  # def set_user
  #   @user = User.find(params[:id])
  # end
end
