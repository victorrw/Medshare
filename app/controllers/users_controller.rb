class UsersController < ApplicationController
  # before_action :set_user, only: [:edit, :update, :show]

  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     redirect_to user_path(@user)
  #   else
  #     render :new
  #   end
  # end

  # def edit
  # end

  # def update
  #   if @user.update(user_params)
  #     redirect_to @user
  #   else
  #     render :edit
  #   end
  # end

   def show
    @user = User.find(params[:id])
   end

  # private

  # def user_params
  #   require(:user).permit(params[:name, :zipcode, :email, :address])
  # end

  # def set_user
  #   @user = User.find(params[:id])
  # end
end
