class BookingsController < ApplicationController
  before_action :set_whitelist, only: [:create]
  before_action :authenticate_user!

  def index
    flat = Flat.find(params[:flat_id])
    if flat && flat.owner == current_user
      @bookings = flat.bookings
    end
  end

  def accept
    flat = Flat.find(params[:flat_id])
    if current_user == flat.owner
      booking = Booking.find(params[:booking_id])
      booking.update(status: "OK")
    end
    redirect_to flat_bookings_path
  end

  def new
    flat = Flat.find(params[:flat_id])
    @booking = flat.bookings.build(guest: current_user, flat: flat)
  end

  def create
    flat = Flat.find(params[:flat_id])
    @whitelist[:status] = "Waiting"
    booking = Booking.new(@whitelist)
    booking.save
    if booking.valid?
      redirect_to flat_path(flat)
    else
      render "new"
    end
  end

  private
  def set_whitelist
    @whitelist = params.require(:booking).permit(:check_in, :check_out, :guest_id, :flat_id)
  end
end
