class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @places = Place.paginate(:page => params[:page])
  end

  def show
    @place = Place.find(params[:id])
  end

  def new
    @place = Place.new
  end

  def create
    current_user.places.create(place_params)
    redirect_to root_path
  end

  def edit
    @place = Place.find(params[:id])

    check_if_logged_in
  end

  def update
    @place = Place.find(params[:id])

    check_if_logged_in

    @place.update_attributes(place_params)
    redirect_to root_path
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to root_path
  end

  private

  def place_params
    params.require(:place).permit(:name, :description, :address)
  end

  def check_if_logged_in
    if @place.user != current_user
      return render text: 'Not Allowed', state: :forbidden
    end
  end

end
