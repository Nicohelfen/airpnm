module Account
  class FlatsController < ApplicationController
    def index
      @flats = current_user.flats
    end

    def edit
      @flat = current_user.flats.find(params[:id])
    end

    def update
      @flat = current_user.flats.find(params[:id])

      if @flat.update(whitelist)
        flash[:notice] = "Bla bla ok"
        redirect_to flat_path
      else
        flash[:alert] = "Bla bla nok"
        render :edit
      end
    end

    def new
      @flat = Flat.new
    end

    def create
      flat = current_user.flats.build(whitelist)

      if flat.save
        redirect_to flat_path(flat)
      else
        render :new
      end
    end

    private

    def whitelist
      params.require(:flat).permit(:name, :description, :city, :zip_code, :street, :capacity, :price, :picture)
    end
  end
end
