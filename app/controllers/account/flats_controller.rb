module Account
  class FlatsController < ApplicationController
    before_action :authenticate_user!

    def index
      @flats = current_user.flats
    end

    def edit
      @flat = Flat.find(params[:id])
    end

    def update
      @flat = Flat.find(params[:id])
      @flat.update(params_whitelist)
      redirect_to flat_path
    end

    def new
      @flat = Flat.new
    end

    def create
      flat = Flat.new(params_whitelist)
      flat.owner = current_user
      flat.save
      redirect_to flat_path(flat)
    end

  private
    def params_whitelist
      params.require(:flat).permit(:name, :description, :city, :zip_code, :street, :capacity, :price)
    end

  end
end
