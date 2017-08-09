class MedsController < ApplicationController
  #Definir o usuário ao qual pertencerá o med:
  # before_action :set_user, only: [:new, :create]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    #exibir todos os meds disponiveis:
    @meds = Med.all.order("created_at DESC")
    if params[:search].present?
      @meds = @meds.search(params[:search])
    end

    # added for geocoding
    @meds = @meds.where.not(latitude: nil, longitude: nil)
    @meds = @meds.where.not(user: current_user)

    @hash = Gmaps4rails.build_markers(@meds) do |med, marker|
      marker.lat med.latitude
      marker.lng med.longitude
      # marker.infowindow render_to_string(partial: "/meds/map_box", locals: { med: med })
    end
  end

  def new
    #exibir a pagina de criação de medicamentos
    @med = Med.new
  end

  def create
    #criar medicamento atrelado ao usuário
    @med = current_user.meds.new(med_params)
    @med.latitude = current_user.latitude
    @med.longitude = current_user.longitude
    #salvar no banco de dados
    if @med.save
      redirect_to med_path(@med)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @med.update
      redirect_to @med
    else
      render :edit
    end
  end

  def show
    @med = Med.find(params[:id])
    # added to display geocoder message
    @alert_message = "You are viewing #{current_user.name}"
    @med_coordinates = { lat: @med.latitude, lng: @med.longitude }
  end

  def delete
    @med = Med.find(params[:id])
    @med.destroy
    redirect_to user_path(current_user)
  end

  private

  # def set_user
  #   #@user = User.find(:user_id)
  # end

  def med_params
    params.require(:med).permit(:name, :description, :exp_date, :photo, :photo_cache, :latitude, :longitude)
  end
end
