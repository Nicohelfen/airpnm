module Account
  class FlatsController < ApplicationController

    def index
      @flats = current_user.flats

    end

    def edit
      @flat = Flat.find(params[:id])
    end

    def update
      @flat = Flat.find(params[:id])

    whitelist = params.require(:flat).permit(:name, :description, :city, :zip_code, :street, :capacity, :price)
    @flat.update(whitelist)
    redirect_to flat_path
    end


    def new
      @flat = Flat.new
    end


    def create

      whitelist = params.require(:flat).permit(:name, :description, :city, :zip_code, :street, :capacity, :price )

      flat = Flat.new(whitelist)
      flat.owner = current_user
      flat.save
      redirect_to flat_path(flat)
    end


  end
end
