class FlatsController < ApplicationController

  def show
    @flat = Flat.find(params[:id])
  end

  def index
    @flats = Flat.near(params[:city], 1)
    @flats = @flats.where("capacity >= #{params[:travellers].to_i}")
    @markers = Gmaps4rails.build_markers(@flats) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
    end
  end
end
