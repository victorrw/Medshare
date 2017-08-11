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
    @user = User.find(current_user)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to new_med_path
    else
       render :edit
    end
  end

  def show
    #returns medicaments available to donation by current user
    @meds = current_user.meds
    #returns all transactions
    @shares = Share.all
  end

  # private

  def user_params
    params.require(:user).permit(:address, :zipcode)
  end
end
