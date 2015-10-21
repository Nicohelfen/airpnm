class BookingsController < ApplicationController
  before_action :set_whitelist, only: [:create]
  before_action :authenticate_user!

  def new
    @booking = Booking.new(guest_id: current_user, status: "waiting")
  end

  def create
    flat = Flat.find(params[:flat_id])
    booking = Booking.new(@whitelist, flat: flat)
    booking.save
    if booking.valid?
      redirect_to flat_path(@whitelist[:flat])
    else
      render "new"
    end
  end

  private
  def set_whitelist
    @whitelist = params.require(:booking).permit(:check_in, :check_out, :guest_id)
  end
end
