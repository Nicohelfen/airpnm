class FlatsController < ApplicationController

  def show
    @flat = Flat.find(params[:id])
  end

  def index
    @flats = Flat.where("city = ?", params[:city])

  end


end
