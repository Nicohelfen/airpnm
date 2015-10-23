module Account
  class FlatsController < ApplicationController
    before_action :authenticate_user!

    def index
      @flats = current_user.flats
    end

    def edit
      @flat = current_user.flats.find(params[:id])
    end

    def update
      @flat = current_user.flats.find(params[:id])
      if @flat.update(params_whitelist)
        flash[:notice] = "Update successful"
        redirect_to flat_path
      else
        flash[:alert] = "Update failed"
        render :edit
      end
    end

    def new
      @flat = Flat.new
    end

    def create
      flat = Flat.new(params_whitelist)
      flat.owner = current_user
      flat = current_user.flats.build(params_whitelist)
      flat.save
      if flat.valid?
        redirect_to flat_path(flat)
      else
        render :new
      end
    end

    private
    def params_whitelist
      params.require(:flat).permit(:name, :description, :city, :zip_code, :street, :capacity, :price, :picture)
    end
  end
end
