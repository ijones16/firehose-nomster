class PhotosController < ApplicationController
  before_action :authenticate_user!

  def create 
    @place = Place.find(params[:place_id])
    @place.photos.create(photos_params)
    if @place.valid?
      redirect_to place_path(@place)
    else
      flash[:alert] = "Caption too long or image not present."
      redirect_to place_path(@place)
    end
  end

  private

  def photos_params
    params.require(:photo).permit(:caption, :picture)
  end
end
